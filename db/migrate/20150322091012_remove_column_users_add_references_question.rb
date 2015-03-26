class RemoveColumnUsersAddReferencesQuestion < ActiveRecord::Migration
  def change
    remove_column :answers, :answer_id, :integer

    reversible do |dir|
      dir.up { remove_foreign_key :answers, :users }
      dir.down { add_foreign_key :answers, :users }
    end

    remove_column :answers, :user_id, :integer
    add_column    :answers, :question_id, :integer

    reversible do |dir|
      dir.down { remove_foreign_key :answers, :questions }
      dir.up { add_foreign_key :answers, :questions }
    end
  end
end
