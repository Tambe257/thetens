class AddLastFmToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lastfm, :string
  end
end
