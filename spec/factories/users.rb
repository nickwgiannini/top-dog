FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@gmail.com" }
    encrypted_password "password"
    password "password"
    password_confirmation "password"
    sign_in_count 0
  end
end
