FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "name #{n}" }
    sequence(:email) { |n| "email#{n}@email.com" }
    password 'abcdefghi'
    password_confirmation 'abcdefghi'
    role { User::ROLE_CONTRIBUTOR }

    trait :as_admin do
      role User::ROLE_ADMIN
    end
  end
end