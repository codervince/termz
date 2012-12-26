class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.integer :source_lang_id
      t.string :source_content
      t.integer :target_lang_id
      t.string :target_content
      t.integer :domain_id
      t.integer :owner_id
      t.integer :approval_id

      t.timestamps
    end
  end
end
