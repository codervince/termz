class AddAncestryToDomains < ActiveRecord::Migration
  def change
    add_column :domains, :ancestry, :string
    add_index :domains, :ancestry
  end
end
