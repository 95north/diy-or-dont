class CreateUserSupplies < ActiveRecord::Migration[6.0]
  def change
    create_table :user_supplies do |t|
      t.integer :quantity
      t.string :measurement
      t.boolean :userneeds
      t.boolean :intoolbox
      t.integer :user_project_id
      t.belongs_to :user
      t.belongs_to :supply


      t.timestamps
    end
  end
end
