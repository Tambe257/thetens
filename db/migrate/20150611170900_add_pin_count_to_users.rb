class AddPinCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pin_count, :integer, :default => 0
  end
end
