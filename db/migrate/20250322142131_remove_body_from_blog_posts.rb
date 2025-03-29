class RemoveBodyFromBlogPosts < ActiveRecord::Migration[8.0]
  def change
    remove_column :blog_posts, :body, :text
  end
end
