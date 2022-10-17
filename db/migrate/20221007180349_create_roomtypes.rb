# frozen_string_literal: true

class CreateRoomtypes < ActiveRecord::Migration[7.0]
  def change
    create_table :roomtypes do |t|
      t.string :type
      t.string :description

      t.timestamps
    end
  end
end
