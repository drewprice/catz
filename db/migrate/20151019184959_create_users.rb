class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :twitter_id
      t.string :nickname
      t.string :name
      t.string :image

      t.timestamps null: false
    end
  end
end
