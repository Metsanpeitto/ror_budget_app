require 'rails_helper'

RSpec.describe 'entities/new', type: :view do
  before(:each) do
    assign(:entity, Entity.new)
  end
end
