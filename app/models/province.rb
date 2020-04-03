# frozen_string_literal: true

class Province < ApplicationRecord
  validates :province, :tax_rate, :rate_type, presence: true
  has_many :users
end
