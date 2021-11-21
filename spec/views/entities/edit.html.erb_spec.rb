require 'rails_helper'

RSpec.describe 'entities/edit', type: :view do
  before(:each) do
    @entity = assign(:entity, Entity.create!)
  end
end
