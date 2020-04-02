# frozen_string_literal: true

class AddRatetypeToProvinces < ActiveRecord::Migration[6.0]
  def change
    add_column :provinces, :rate_type, :string
  end
end
