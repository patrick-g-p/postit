class CreatePostCategories < ActiveRecord::Migration
  def change
    create_table :post_categories do |t|
      t.column :post_id, :integer
      t.column :category_id, :integer
    end
  end
end
