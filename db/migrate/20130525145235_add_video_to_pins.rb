class AddVideoToPins < ActiveRecord::Migration
  def change
    add_column :pins, :video, :string
  end
end
