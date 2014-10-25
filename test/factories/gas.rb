FactoryGirl.define do
  factory :gas do
    station { Faker::Company.name }
    country { Faker::Address.country }
    region { Faker::Address.country }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    lat { Faker::Address.latitude }
    long { Faker::Address.longitude }
    reg_price { Faker::Number.number(2) }
    mid_price { Faker::Number.number(2) }
    pre_price { Faker::Number.number(2) }
    diesel_price { Faker::Number.number(2) }
    reg_update { Faker::Number.number(2) }
    mid_update { Faker::Number.number(2) }
    pre_update { Faker::Number.number(2) }
    diesel_update { Faker::Number.number(2) }
  end
end