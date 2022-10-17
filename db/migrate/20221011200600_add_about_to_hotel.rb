# frozen_string_literal: true

class AddAboutToHotel < ActiveRecord::Migration[7.0]
  def change
    add_column :hotels, :about, :string
  end
end
