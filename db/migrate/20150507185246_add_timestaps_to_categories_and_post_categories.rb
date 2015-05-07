class AddTimestapsToCategoriesAndPostCategories < ActiveRecord::Migration
  def change
    add_column :categories, :created_at, :datetime
    add_column :categories, :updated_at, :datetime
    add_column :post_categories, :created_at, :datetime
    add_column :post_categories, :updated_at, :datetime
  end
end
