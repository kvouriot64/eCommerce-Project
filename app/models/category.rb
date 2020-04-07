# frozen_string_literal: true

class Category < ApplicationRecord
  validates :category, presence: true
  validates :category, uniqueness: true

  has_many :category_products
  has_many :products, through: :category_products
  accepts_nested_attributes_for :category_products, allow_destroy: true

  def display_name
    category
  end
end
