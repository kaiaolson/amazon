# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 100.times do
#   Product.create(name: Faker::Commerce.product_name, description: Faker::Lorem.paragraph, price: Faker::Commerce.price)
# end
#
#
# ["Books","Clothing","Electronics","Home","Music","Movies","Sports"].each do |department|
#   Department.create(name: department)
# end

Product.all.each do |product|
  random = rand(1..7)
  product.department_ids = Department.ids.sample(random)
end
