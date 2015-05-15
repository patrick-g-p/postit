class VotesTimestamps < ActiveRecord::Migration
  def change
    change_table :votes do |t|
      t.timestamps
    end
  end
end
