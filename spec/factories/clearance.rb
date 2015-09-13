FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    first_name "Steve"
    last_name "Rogers"
    email
    password "password"
    role "stockholder"

    factory :ironman do
      first_name "Tony"
      last_name "Stark"
    end
  end

  factory :admin, class: User do
    first_name "Admin"
    last_name  "User"
    email
    password "password"
    role "admin"
  end

  trait :manager do
    role "manager"
  end

  trait :stockholder do
    role "stockholder"
  end
end
