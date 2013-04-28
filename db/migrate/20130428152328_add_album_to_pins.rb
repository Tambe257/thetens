class AddAlbumToPins < ActiveRecord::Migration
  def change
    add_column :pins, :album, :string
  end
end
