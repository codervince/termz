class AddFlagsAndSourceToTranslations < ActiveRecord::Migration
  def change

  	add_column :translations, :is_public, :boolean, :default => true if ActiveRecord::Base.connection.table_exists? :users
	add_column :translations, :is_term, :boolean, :default => true if ActiveRecord::Base.connection.table_exists? :users
	add_column :translations, :source_id, :integer if ActiveRecord::Base.connection.table_exists? :users
  end
end
