# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.references :hotel, null: false, foreign_key: true
      t.references :roomtype, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
