# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'date'
require 'faker'

CategoryProduct.destroy_all

Category.destroy_all
Product.destroy_all
# Province.destory
OrderStatus.destroy_all

statuses = %w[Pending Paid Shipped New On_Sale None]

# provinces = {
#   'Alberta' => [0, 'GST'],
#   'British Columbia' => [0.07, 'PST'],
#   'Saskatchewan' => [0.06, 'PST'],
#   'Manitoba' => [0.07, 'PST'],
#   'New Brunswick' => [0.15, 'HST'],
#   'Nova Scotia' => [0.15, 'HST'],
#   'Ontario' => [0.13, 'HST'],
#   'Quebec' => [0.9975, 'QST'],
#   'Prince Edward Island' => [0.15, 'HST'],
#   'Yukon' => [0, 'GST'],
#   'Nunavut' => [0, 'GST'],
#   'Northwest Territories' => [0, 'GST'],
#   'Newfoundland and Labrador' => [0.15, 'HST']
# }

# provinces.each do |province, value|
#   Province.create(province: province, tax_rate: value[0], rate_type: value[1])
# end

statuses.each do |status|
  OrderStatus.create(status: status)
end

5.times do
  Category.create(category: Faker::Commerce.department)
end

new_status = OrderStatus.where(status: 'New').first
100.times do
  product = Product.new(
    product_name: Faker::Commerce.product_name,
    description: Faker::Company.bs,
    price: Faker::Commerce.price
  )

  product.OrderStatus = new_status

  product.save

  first_category = Category.first.id
  last_category = first_category + Category.count - 1

  category = Category.find(rand(first_category..last_category))
  rand(1..2).times do
    CategoryProduct.create(Product_id: product.id, Category_id: category.id)
  end
end

# if Rails.env.development?
#   AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
# end
