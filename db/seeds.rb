# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
7.times do
  Category.create(name: Faker::Company.profession)
end

50.times do
  Tool.create(name: Faker::Superhero.name,
              category_id: rand(1..7),
              price: rand(75.0).to_f,
              quantity: rand(10))
end
