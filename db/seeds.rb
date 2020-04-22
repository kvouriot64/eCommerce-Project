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
Province.destroy_all
OrderStatus.destroy_all

statuses = %w[Pending Paid Shipped]

provinces = {
  'Alberta' => [0, 'GST'],
  'British Columbia' => [0.07, 'PST'],
  'Saskatchewan' => [0.06, 'PST'],
  'Manitoba' => [0.07, 'PST'],
  'New Brunswick' => [0.15, 'HST'],
  'Nova Scotia' => [0.15, 'HST'],
  'Ontario' => [0.13, 'HST'],
  'Quebec' => [0.9975, 'QST'],
  'Prince Edward Island' => [0.15, 'HST'],
  'Yukon' => [0, 'GST'],
  'Nunavut' => [0, 'GST'],
  'Northwest Territories' => [0, 'GST'],
  'Newfoundland and Labrador' => [0.15, 'HST']
}

provinces.each do |province, value|
  Province.create(province: province, tax_rate: value[0], rate_type: value[1])
end

statuses.each do |status|
  OrderStatus.create(status: status)
end

5.times do
  Category.create(category: Faker::Commerce.unique.department)
end

100.times do
  product = Product.new(
    product_name: Faker::Commerce.product_name,
    description: Faker::Company.bs,
    price: (Faker::Commerce.price * 100.0)
  )

  product.save

  first_category = Category.first.id
  last_category = first_category + Category.count - 1

  category = Category.find(rand(first_category..last_category))
  rand(1..2).times do
    CategoryProduct.create(product: product, category: category)
  end

  downloaded_image = open(URI.escape("https://source.unsplash.com/600x600/?#{product.product_name}"))
  product.image.attach(io: downloaded_image, filename: "m-#{product.product_name}")
  sleep(1)
end

all_category = Category.new(category: 'All')

all_category.save

Product.all.each do |product|
  CategoryProduct.create(category_id: all_category.id, product_id: product.id)
end

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end
