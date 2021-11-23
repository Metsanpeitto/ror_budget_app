FactoryBot.define do
  sequence :email do |n|
    "me#{n}@me.com"
  end

  sequence :name do |n|
    "Aarnio #{n}"
  end

  factory :user do
    name
    email
    password { '123456' }
    password_confirmation { '123456' }

    factory :user_with_groups do
      transient do
        icon { 'https://i.imgur.com/HAZNFh4.png' }
      end

      groups do
        Array.new('home', icon) { association(:group) }
      end
    end

    factory :user_with_entities do
      transient do
        amount { 5 }
      end

      entities do
        Array.new('Gas', amount) { association(:entity) }
      end
    end
  end
end
