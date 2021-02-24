FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    username { Faker::Internet.username(separators: '_') }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    introduction { Faker::Lorem.sentence }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png')) }
  end
end
