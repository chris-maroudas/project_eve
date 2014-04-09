class AddNicknameToUser < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string, after: :email
  end
end
