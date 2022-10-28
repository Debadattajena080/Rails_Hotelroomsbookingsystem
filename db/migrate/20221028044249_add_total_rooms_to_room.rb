class AddTotalRoomsToRoom < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :total_rooms, :integer
  end
end
