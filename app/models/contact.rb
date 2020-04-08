class Contact < ApplicationRecord
  validates :title, :email, :phone_number, presence: true
end
