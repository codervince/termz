class AddLocaleToUsers < ActiveRecord::Migration
  

  def up
	add_column :users, :locale_id, :integer
  end

  def down
  	remove_column :users, :locale_id if ActiveRecord::Base.connection.table_exists? :users
  end

end
