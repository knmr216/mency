FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email ( Faker::internet.email )
    password { Faker::internet.password }
    password_confirmation { password }
    introduction { Faker::Lorem.sentence }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png')) }
  end
end
