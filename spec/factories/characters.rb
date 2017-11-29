FactoryBot.define do
  factory :character do
    short_name { Faker::Lorem.characters(2) }
    full_name { Faker::Lorem.sentence(1, false, 2) }
  end
end
