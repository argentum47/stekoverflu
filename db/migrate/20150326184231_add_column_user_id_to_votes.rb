class AddColumnUserIdToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :user_id, :integer
    add_column :tags, :description, :string
    add_column :answers, :user_id, :integer, null: false

    reversible do |dir|
      dir.up do
        add_foreign_key :votes, :users
      end

      dir.down do
        remove_foreign_key :votes, :users
      end
    end
  end
end
