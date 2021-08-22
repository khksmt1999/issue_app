require 'date'

FactoryBot.define do
  factory :user do
    username { 'テストユーザー' }
    email { 'test@example.com' }
    password { 'password' }
  end

  factory :deleted_user, class: User do
    username { 'テストユーザー' }
    email { 'test@example.com' }
    password { 'password' }
    deleted_at { DateTime.now - 1 }
  end
end