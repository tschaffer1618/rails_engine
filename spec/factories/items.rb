FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    description { Faker::TvShows::MichaelScott.quote }
    unit_price { rand(1..10000) }
    merchant
  end
end
