class ChangeUserColumn < ActiveRecord::Migration
  def up
  	rename_column :users, :password_salt,:password_digest 
  end

  def down
  	rename_column :users, :password_digest, :password_salt
  end
end
