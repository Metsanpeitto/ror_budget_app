FactoryBot.define do
  factory :entity do
    user
    name { 'The title' }
    amount { 5 }

    factory :entity_with_groups do
      transient do
        groups_count { 5 }
      end

      groups do
        Array.new(groups_count) { association(:group) }
      end
    end
  end
end
