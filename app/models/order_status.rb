# frozen_string_literal: true

class OrderStatus < ApplicationRecord
  validates :status, presence: true

  has_many :orders
  has_many :products

  # allows the name of the status to be displayed in activeadmin
  def display_name
    status
  end
end
