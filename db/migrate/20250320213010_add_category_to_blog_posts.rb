class AddCategoryToBlogPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :blog_posts, :category, :string
  end
end
