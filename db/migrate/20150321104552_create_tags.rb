class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.text :name
      t.integer :tags_count

      t.timestamps null: false
    end
  end
end
