# frozen_string_literal: true

class AddColumnsToHotels < ActiveRecord::Migration[7.0]
  def change
    add_column :hotels, :longitude, :float
    add_column :hotels, :latitude, :float
  end
end
