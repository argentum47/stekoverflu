class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :upvotes
      t.integer :downvotes
      t.boolean :accepted, default: false
      t.string :postable_type
      t.integer :postable_id

      t.references :user, null: false
      t.timestamps null: false
    end
  end
end
