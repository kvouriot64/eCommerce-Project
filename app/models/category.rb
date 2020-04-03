# frozen_string_literal: true

class Category < ApplicationRecord
  validates :category, presence: true

  has_many :category_products
  has_many :products, through: :category_products
end
