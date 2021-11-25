class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :entities
  before_destroy { entities.clear }

  validates :name, :icon, :user, presence: true

  def total
    entities.sum('amount')
  end
end
