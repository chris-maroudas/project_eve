class AddImageUrlAndSteamusertoUser < ActiveRecord::Migration
  def change
    add_column :users, :image_url, :string
    add_column :users, :steam_user, :boolean
  end
end
