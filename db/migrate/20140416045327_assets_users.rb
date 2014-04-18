class AssetsUsers < ActiveRecord::Migration
  def up
    create_table :assets_users, :id => false do |t|
      t.references :assets, :null => false
      t.references :users, :null => false
    end
  end

  def down
  end
end
