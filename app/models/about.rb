# frozen_string_literal: true

class About < ApplicationRecord
  validates :title, :content, presence: true
end
