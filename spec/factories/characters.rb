FactoryBot.define do
  sequence :short_name do |n|
    "TE#{n}"
  end

  sequence :full_name do |n|
    "Test Character #{n}"
  end

  factory :character do
    short_name { generate(:short_name) }
    full_name { generate(:full_name) }
  end
end
