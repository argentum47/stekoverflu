class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :nickname, null: false, unique: true, index: true
      t.string  :email, null: false, index: true
      t.string  :provider
      t.integer :uid
      t.integer :points, default: 1

      t.timestamps null: false
    end
  end
end
