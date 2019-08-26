class CreateProjectSupplies < ActiveRecord::Migration[6.0]
  def change
    create_table :project_supplies do |t|
      t.integer :quantity
      t.string :note
      t.boolean :mandatory
      t.belongs_to :supply
      t.belongs_to :project


      t.timestamps
    end
  end
end
