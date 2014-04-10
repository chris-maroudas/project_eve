class AddUseridToSteamMetadata < ActiveRecord::Migration
  def change
    add_column :steam_metadata, :user_id, :integer
  end
end
