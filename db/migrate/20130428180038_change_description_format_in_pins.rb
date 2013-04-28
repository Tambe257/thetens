class ChangeDescriptionFormatInPins < ActiveRecord::Migration
  def self.up
   change_column :pins, :description, :text
  end

  def self.down
   change_column :pins, :description, :text
  end
end
