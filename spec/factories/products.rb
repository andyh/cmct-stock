FactoryGirl.define do
  factory :product do
    name Faker::App.name
    brand
    category
    price 9.99
  end

end
