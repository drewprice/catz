class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :giphy_id

      t.timestamps null: false
    end
  end
end
