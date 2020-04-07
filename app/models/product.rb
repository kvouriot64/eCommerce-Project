# frozen_string_literal: true

class Product < ApplicationRecord
  validates :product_name, :description, :price, presence: true
  validates :price, numericality: true

  has_one_attached :image

  paginates_per 10

  has_many :category_products
  has_many :categories, through: :category_products
  accepts_nested_attributes_for :category_products, allow_destroy: true

  has_many :order_products
  has_many :orders, through: :order_products
end
