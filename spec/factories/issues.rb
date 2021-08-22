FactoryBot.define do
  factory :issue do
    title { 'テストを書く' }
    description { 'RSpec & Capybara & FactoryBotを準備する' }
    user
  end
end