class AddProjectIdToTranslations < ActiveRecord::Migration
  def change
  	add_column :translations, :project_id, :integer 
  end
end
