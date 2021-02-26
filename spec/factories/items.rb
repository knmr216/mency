FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    category_id { Faker::Number.between(from: 1, to: 5) }
    capacity { Faker::Number.number }
    unit_id { Faker::Number.between(from: 1, to: 3) }
    price {Faker::Number.number }
    introduction { Faker::Lorem.sentence }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png')) }
    association :brand
  end
end
