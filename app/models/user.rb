# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :street_address, :email, :password, :postal_code, :phone_number, presence: true
  validates :email, :phone_number, uniqueness: true

  belongs_to :province
  has_many :orders
end
