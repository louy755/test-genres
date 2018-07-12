FactoryBot.define do
  factory :genre do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
  end
end
