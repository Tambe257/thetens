class AddVideoHtmlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :video_html, :string
  end
end
