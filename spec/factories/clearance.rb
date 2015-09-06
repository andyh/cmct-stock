FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    first_name "Tony"
    last_name "Stark"
    email
    password "password"
  end
end