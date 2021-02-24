FactoryBot.define do
  factory :brand do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "abc123" }
    password_confirmation { password }
    introduction { Faker::Lorem.sentence }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png')) }
  end
end
