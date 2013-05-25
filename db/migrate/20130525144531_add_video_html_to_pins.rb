class AddVideoHtmlToPins < ActiveRecord::Migration
  def change
    add_column :pins, :video_html, :string
  end
end
