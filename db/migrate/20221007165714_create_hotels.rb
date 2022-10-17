# frozen_string_literal: true

class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :hotelname
      t.string :city
      t.string :address

      t.timestamps
    end
  end
end
