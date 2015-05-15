class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :vote
      t.string :votable_type
      t.integer :votable_id, :user_id
    end
  end
end
