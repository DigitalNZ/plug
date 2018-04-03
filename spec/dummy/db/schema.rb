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

ActiveRecord::Schema.define(version: 20180403024712) do

  create_table "plug_features", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "slug"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "notice"
    t.index ["name"], name: "index_plug_features_on_name"
    t.index ["slug"], name: "index_plug_features_on_slug"
  end

  create_table "plug_site_notices", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "notice"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_plug_site_notices_on_name"
    t.index ["slug"], name: "index_plug_site_notices_on_slug"
  end

end
