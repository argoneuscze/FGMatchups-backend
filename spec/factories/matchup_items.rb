FactoryBot.define do
  factory :matchup_item do
    description { Faker::Lorem.sentence }
    association :matchup
  end
end