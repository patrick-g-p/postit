class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :title, :string
      t.column :url, :string
      t.column :description, :text
    end
  end
end
