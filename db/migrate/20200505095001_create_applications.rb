class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :company
      t.string :position
      t.string :status
      t.string :deadline
      t.string :description
      t.string :comments
      t.integer :user_id
    end
  end
end
