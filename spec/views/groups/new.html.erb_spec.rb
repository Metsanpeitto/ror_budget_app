require 'rails_helper'

RSpec.describe 'groups/new', type: :view do
  before(:each) do
    assign(:group, Group.new(
                     name: 'MyString',
                     icon: 1,
                     user: nil,
                     entity: ''
                   ))
  end

  it 'renders new group form' do
    render

    assert_select 'form[action=?][method=?]', groups_path, 'post' do
      assert_select 'input[name=?]', 'group[name]'

      assert_select 'input[name=?]', 'group[icon]'

      assert_select 'input[name=?]', 'group[user_id]'

      assert_select 'input[name=?]', 'group[entity]'
    end
  end
end
