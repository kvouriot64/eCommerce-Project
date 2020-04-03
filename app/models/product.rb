# frozen_string_literal: true

class Product < ApplicationRecord
  validates :product_name, :description, :price, presence: true
  validates :price, numericality: true

  has_one_attached :image

  belongs_to :OrderStatus

  # has_many :category_products
  # has_many :categories, through: :category_products

  # has_many :order_products
  # has_many :orders, through: :order_products
end
