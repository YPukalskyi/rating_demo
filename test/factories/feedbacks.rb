FactoryBot.define do
  factory :feedback do
    user    { User.order("RANDOM()").first    || association(:user)    }
    product { Product.order("RANDOM()").first || association(:product) }

    comment { Faker::Lorem.sentence }
    rating  { rand(1..5)            }
  end
end
