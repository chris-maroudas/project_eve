class FixAssetsAndUsersColumnNameError < ActiveRecord::Migration
  def up
    rename_column :assets_users, :assets_id, :asset_id
    rename_column :assets_users, :users_id, :user_id
  end

  def down
  end
end
