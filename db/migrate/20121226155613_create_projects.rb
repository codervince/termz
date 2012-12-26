class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :source_lang_id
      t.string :access_token
      t.integer :owner_id

      t.timestamps
    end
  end
end
