class AddRankToPins < ActiveRecord::Migration
  def change
    add_column :pins, :rank, :integer
  end
end
