class Entity < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :groups
  before_destroy { groups.clear }
end
