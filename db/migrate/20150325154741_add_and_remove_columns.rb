class AddAndRemoveColumns < ActiveRecord::Migration
  def change
    remove_column :answers, :title, :string
    remove_column :answers, :upvotes, :integer
    remove_column :answers, :downvotes, :integer

    remove_column :questions, :upvotes, :integer
    remove_column :questions,:downvotes, :integer

    create_table :votes do |t|
      t.integer :voteable_id
      t.string  :voteable_type
      t.integer :votes, default: 0
    end

    create_join_table :questions, :tags do |t|
      t.index [:question_id, :tag_id]
    end
  end
end
