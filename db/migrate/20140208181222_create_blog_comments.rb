class CreateBlogComments < ActiveRecord::Migration
  def change
    create_table :blog_comments do |t|
      t.integer :post_id
      t.text :body

      t.timestamps
    end
    add_index :blog_comments, :post_id
  end
end
