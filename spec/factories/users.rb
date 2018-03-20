FactoryBot.define do
  factory :user do
    role "member"
    first_name "#{Faker::Name.first_name}"
    last_name "#{Faker::Name.last_name}"
    username "#{Faker::Name.first_name}"
    sequence(:email) { |n| "user-#{n}@gmail.com" }
    encrypted_password "password"
    password "password"
    password_confirmation "password"
    sign_in_count 0
  end
end
