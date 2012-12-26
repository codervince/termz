class AddNameToUsers < ActiveRecord::Migration

  def up
	add_column :users, :name, :string
  end

  def down
  	remove_column :users, :name if ActiveRecord::Base.connection.table_exists? :users
  end



end
