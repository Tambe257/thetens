class AddYearToPins < ActiveRecord::Migration
  def change
    add_column :pins, :year, :string
  end
end
