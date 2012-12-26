class AddGuestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :guest, :boolean if ActiveRecord::Base.connection.table_exists? :users
  end
end
