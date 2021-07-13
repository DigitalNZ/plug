# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_04_24_015828) do

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
    t.string "theme"
    t.index ["name"], name: "index_plug_site_notices_on_name"
    t.index ["slug"], name: "index_plug_site_notices_on_slug"
  end

end
