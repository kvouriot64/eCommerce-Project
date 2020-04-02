# frozen_string_literal: true

class Product < ApplicationRecord
  validates :product_name, :description, :price, presence: true
  validates :price, numericality: { only_integer: true }

  belongs_to :order_statuses

  has_many :categories, through: :category_products
  has_many :category_products

  belongs_to :order_statuses
end
