class AddFactToCats < ActiveRecord::Migration
  def change
    add_column :cats, :fact, :text
  end
end
