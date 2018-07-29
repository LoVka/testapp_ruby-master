FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password '12345678'
    password_confirmation '12345678'
    sequence(:full_name) {|n| "User#{n}" }
    address 'Kyiv'
    age 30
    approved true
    confirmed_at Time.now.utc
  end
end
