class CreateApplications < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :company
      t.string :position
      t.string :deadline
      t.string :desccription
      t.string :comments
      t.integer :user_id
    end
  end
end
