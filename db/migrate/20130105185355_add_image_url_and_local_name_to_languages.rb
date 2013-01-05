class AddImageUrlAndLocalNameToLanguages < ActiveRecord::Migration
  def change
    add_column :languages, :image_url, :string
    add_column :languages, :local_name, :string
  end
end
