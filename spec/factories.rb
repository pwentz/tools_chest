FactoryGirl.define do
  factory :tool do
    name { Faker::Superhero.name }
    price { Faker::Commerce.price }
    quantity 
    user 
  end

  factory :user do
    username { Faker::Internet.user_name }
    password { Faker::Internet.password }
  end

  sequence :quantity do |n|
    "#{n}"
  end
end
