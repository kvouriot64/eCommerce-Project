# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, :last_name, :street_address, :email, :password, :postal_code, :phone_number, presence: true
  validates :email, :phone_number, uniqueness: true

  belongs_to :Province
  has_many :orders
end
