FactoryBot.define do
  factory :user do
    name { 'Michael Example' }
    email { 'michael@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { true }
    activated { true }
    activated_at { Time.now }
  end

  factory :archer, class: User do
    name { 'Sterling Archer' }
    email { 'duchess@example.gov' }
    password { 'password' }
    password_confirmation { 'password' }
    activated { true }
    activated_at { Time.now }
  end

  factory :malory, class: User do
    name { 'MALORY' }
    email { 'maroly@example.gov' }
    password { 'password' }
    password_confirmation { 'password' }
    activated { false }
    activated_at { Time.now }
  end

  factory :lana, class: User do
    name { 'LANA' }
    email { 'lana@example.gov' }
    password { 'password' }
    password_confirmation { 'password' }
    activated { false }
    activated_at { Time.now }
  end

  factory :continuous_users, class: User do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "user-#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    activated { true }
    activated_at { Time.now }
  end
end
