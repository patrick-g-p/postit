class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :body, :text
      t.column :user_id, :integer
      t.column :post_id, :integer
    end
  end
end
