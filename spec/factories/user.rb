FactoryBot.define do
  factory :user do
    name { 'Kandy' }
    sequence(:email) { |n| "kandy#{n}@example.com" }
    confirmed_at { '01-01-01T00:00:00' }
    password { 'password' }
  end
end
