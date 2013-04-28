class AddArtistToPins < ActiveRecord::Migration
  def change
    add_column :pins, :artist, :string
  end
end
