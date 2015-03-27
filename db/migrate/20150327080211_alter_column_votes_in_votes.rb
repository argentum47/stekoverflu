class AlterColumnVotesInVotes < ActiveRecord::Migration
  def change
    rename_column :votes, :votes, :score
    change_column :votes, :score, :integer, default: 0
  end
end
