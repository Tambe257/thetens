class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :pin_count, :pins_count
  end
end
