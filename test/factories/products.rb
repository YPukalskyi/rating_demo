FactoryBot.define do
  factory :product do
    title       { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph(sentence_count: 5) }
  end
end
