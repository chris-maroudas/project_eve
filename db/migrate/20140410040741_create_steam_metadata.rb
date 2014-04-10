class CreateSteamMetadata < ActiveRecord::Migration
  def change
    create_table :steam_metadata do |t|
      t.string :uid
      t.string :profile_url
      t.timestamps
    end
  end
end
