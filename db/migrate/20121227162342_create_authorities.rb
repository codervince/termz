class CreateAuthorities < ActiveRecord::Migration
  def change
    create_table :authorities do |t|
      t.integer :translation_id
      t.integer :source_id

      t.timestamps
    end
  end
end
