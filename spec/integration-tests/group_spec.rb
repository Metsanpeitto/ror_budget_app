require 'rails_helper'

RSpec.describe 'Group new view', type: :feature do
  subject { page }
  before do
    login_user
    @current_user = User.last
    @group = FactoryBot.create :group_with_entities, entities_count: 3, user: @current_user
    visit new_group_path
  end

  describe 'with user signed in' do
    it 'I can see the page title.' do
      page.all('div', class: 'top-title')
    end

    it 'I can see the field name. ' do
      expect(page).to have_content 'Name'
    end

    it 'I can see the field icon. ' do
      expect(page).to have_content 'Icon'
    end

    it 'shows the button with label "New"' do
      expect(page).to have_button('New')
    end

    it 'shows the button with label "Back"' do
      page.all('div', class: 'btn-danger')
    end
  end
end
