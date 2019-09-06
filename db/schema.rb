# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_26_190410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "project_supplies", force: :cascade do |t|
    t.integer "quantity"
    t.string "note"
    t.boolean "mandatory"
    t.bigint "supply_id"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_project_supplies_on_project_id"
    t.index ["supply_id"], name: "index_project_supplies_on_supply_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "overview"
    t.string "description"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "supplies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_projects", force: :cascade do |t|
    t.string "status"
    t.string "usernote"
    t.integer "reviewDifficulty"
    t.integer "reviewFun"
    t.integer "reviewTime"
    t.string "reviewText"
    t.date "completedDate"
    t.bigint "user_id"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_user_projects_on_project_id"
    t.index ["user_id"], name: "index_user_projects_on_user_id"
  end

  create_table "user_supplies", force: :cascade do |t|
    t.integer "quantity"
    t.string "measurement"
    t.boolean "userneeds"
    t.boolean "intoolbox"
    t.integer "user_project_id"
    t.string "project_name"
    t.bigint "user_id"
    t.bigint "supply_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["supply_id"], name: "index_user_supplies_on_supply_id"
    t.index ["user_id"], name: "index_user_supplies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "location"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
