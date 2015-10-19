class RemoveFactFromCats < ActiveRecord::Migration
  def change
    remove_column :cats, :fact
  end
end
