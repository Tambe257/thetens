class AddRatingToPins < ActiveRecord::Migration
  def change
    add_column :pins, :rating, :integer
  end
end
