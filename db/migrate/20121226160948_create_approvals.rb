class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.string :name
      t.integer :ranking


    end
  end
end
