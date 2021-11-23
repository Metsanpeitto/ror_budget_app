require 'rails_helper'

RSpec.describe 'Group new view', type: :feature do
  subject { page }
  before do
    login_user
    @current_user = User.last
    @entity = FactoryBot.create :entity_with_groups, groups_count: 3, user: @current_user
    visit new_entity_path
  end

  describe 'with user signed in' do
    it 'I can see the page title.' do
      page.all('div', class: 'top-title')
    end

    it 'I can see the field name. ' do
      expect(page).to have_content 'Name'
    end

    it 'I can see the field amount. ' do
      expect(page).to have_content 'Amount'
    end

    it 'I can see the field group ids. ' do
      expect(page).to have_content 'Group ids'
    end

    it 'shows the button with label "New"' do
      expect(page).to have_button('New')
    end

    it 'shows the button with label "Back"' do
      page.all('div', class: 'btn-danger')
    end
  end
end
