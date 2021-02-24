FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    username { "Taro_Yamada" }
    email { Faker::Internet.email }
    password { "abc123" }
    password_confirmation { password }
    introduction { Faker::Lorem.sentence }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png')) }
  end
end
