class ChangeRatingToString < ActiveRecord::Migration
  def up
  	change_column :pins, :rating, :string
  end

  def down
  	change_column :pins, :rating, :integer
  end
end
