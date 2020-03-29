class Order < ApplicationRecord
  belongs_to :User
  belongs_to :Status
end
