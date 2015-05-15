class VotesColumnNameFix < ActiveRecord::Migration
  def change
    rename_column(:votes, :votable_type, :voteable_type)
    rename_column(:votes, :votable_id, :voteable_id)
  end
end
