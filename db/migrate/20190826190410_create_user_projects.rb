class CreateUserProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :user_projects do |t|
      t.string :status
      t.string :usernote
      t.integer :reviewDifficulty
      t.integer :reviewFun
      t.integer :reviewTime
      t.string :reviewText
      t.date :completedDate
      t.belongs_to :user
      t.belongs_to :project

      t.timestamps
    end
  end
end
