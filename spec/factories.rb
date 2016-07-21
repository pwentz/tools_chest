FactoryGirl.define do
  factory :tool do
    name { Faker::Superhero.name }
    price { Faker::Commerce.price }
    quantity 
    user 
    category
  end

  factory :user do
    username { Faker::Internet.user_name }
    password { Faker::Internet.password }
    role
  end

  sequence :quantity do |n|
    "#{n}"
  end

  factory :category do
    name { Faker::Superhero.power }
  end

  sequence :role do |n|
    0
  end
end
