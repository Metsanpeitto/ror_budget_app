require 'rails_helper'

RSpec.describe "groups/edit", type: :view do
  before(:each) do
    @group = assign(:group, Group.create!(
      name: "MyString",
      icon: 1,
      user: nil,
      entity: ""
    ))
  end

  it "renders the edit group form" do
    render

    assert_select "form[action=?][method=?]", group_path(@group), "post" do

      assert_select "input[name=?]", "group[name]"

      assert_select "input[name=?]", "group[icon]"

      assert_select "input[name=?]", "group[user_id]"

      assert_select "input[name=?]", "group[entity]"
    end
  end
end
