# frozen_string_literal: true

class ChangeSomeName < ActiveRecord::Migration[7.0]
  def change
    rename_column :roomtypes, :type, :roomtypename
  end
end
