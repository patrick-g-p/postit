class ModifyPosts < ActiveRecord::Migration
  change_table(:posts) do |t|
    t.column :user_id, :integer
  end
end
