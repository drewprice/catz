class RenameTwitterIdColumnOnUsers < ActiveRecord::Migration
  def change
    rename_column :users, :twitter_id, :uid
  end
end
