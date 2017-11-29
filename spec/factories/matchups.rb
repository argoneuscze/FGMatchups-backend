FactoryBot.define do
  factory :matchup do
    association :char_as, factory: :character
    association :char_against, factory: :character
  end
end
