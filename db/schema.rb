# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_09_111801) do

  create_table "foods", force: :cascade do |t|
    t.string "type", null: false
    t.date "expiration_date"
    t.string "brand"
    t.float "volume"
    t.string "size"
    t.string "color"
    t.integer "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_foods_on_pet_id"
  end

  create_table "fridges", force: :cascade do |t|
    t.string "brand"
    t.date "last_technical_check"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fridges_on_user_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.integer "age_in_months"
    t.date "date_of_death"
    t.string "favorite_food", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email"
    t.date "birth_date", null: false
    t.integer "pet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
