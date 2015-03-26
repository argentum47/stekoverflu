class RemoveColumnPostableId < ActiveRecord::Migration
  def change
    drop_table :posts

    create_table :questions do |t|
      t.string :title
      t.text   :content
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0
      t.integer :stars, default: 0

      t.references :user, null: false
      t.timestamps null: false
    end

    reversible do |dir|
      dir.up { add_foreign_key :questions, :users  }
      dir.down { remove_foreign_key :questions, :users }
    end

    create_table :answers do |t|
      t.string :title
      t.text   :content
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0
      t.boolean :accepted, default: false

      t.references :answer, null: false
      t.references :user, null: false
      t.timestamps null: false
    end

    reversible do |dir|
      dir.up { add_foreign_key :answers, :users  }
      dir.down { remove_foreign_key :answers, :users }
    end

    create_table :profiles do |t|
      t.integer :points, default: 2
      t.references :user, null: false
    end

    reversible do |dir|
      dir.up { add_foreign_key :profiles, :users  }
      dir.down { remove_foreign_key :profiles, :users }
    end
  end
end
