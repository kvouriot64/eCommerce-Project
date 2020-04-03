# frozen_string_literal: true

class Order < ApplicationRecord
  validates :quantity, :total_cost, :order_date, presence: true
  validates :quantity, :total_cost, numericality: true

  belongs_to :user
  belongs_to :OrderStatus

  has_many :order_products
  has_many :products, through: :order_products
end
