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

ActiveRecord::Schema.define(version: 20171128210652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "short_name"
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matchup_items", force: :cascade do |t|
    t.integer "matchup_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matchup_id"], name: "index_matchup_items_on_matchup_id"
  end

  create_table "matchups", force: :cascade do |t|
    t.integer "char_as_id"
    t.integer "char_against_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["char_against_id"], name: "index_matchups_on_char_against_id"
    t.index ["char_as_id"], name: "index_matchups_on_char_as_id"
  end

  add_foreign_key "matchup_items", "matchups"
  add_foreign_key "matchups", "characters", column: "char_against_id"
  add_foreign_key "matchups", "characters", column: "char_as_id"
end
