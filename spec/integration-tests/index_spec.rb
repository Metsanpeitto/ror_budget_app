require 'rails_helper'

RSpec.describe 'Index view', type: :feature do
  subject { page }
  before do
    login_user
    @user = User.last
    visit root_path
  end

  describe 'after signin' do
    it 'I can see name of the user on the top right corner ' do
      expect(page).to have_content @user.name
    end

    it 'I can see the name of the section Budgets' do
      page.all('h1', text: 'Budgets')
    end

    it 'I can see one of the group cards' do
      page.all('a', text: 'card-link')
    end

    it 'I can see the center of the card' do
      page.all('div', text: 'card-center')
    end

    it 'When I click on a user, I am redirected to that user show page.' do
      find_link('Add new budget').click
      expect(current_path).to eq new_group_path
    end
  end
end
