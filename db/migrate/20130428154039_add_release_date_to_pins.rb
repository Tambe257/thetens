class AddReleaseDateToPins < ActiveRecord::Migration
  def change
    add_column :pins, :date, :integer
  end
end
