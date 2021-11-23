FactoryBot.define do
  factory :group do
    user
    name { 'Petrol' }
    icon { 'https://i.imgur.com/HAZNFh4.png' }

    factory :group_with_entities do
      transient do
        entities_count { 5 }
      end

      entities do
        Array.new(entities_count) { association(:entity) }
      end
    end
  end
end
