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

ActiveRecord::Schema.define(version: 20160905204040) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "region"
    t.string "postal_code"
    t.string "country"
    t.float  "lat"
    t.float  "lng"
    t.index ["lat", "lng"], name: "index_addresses_on_lat_and_lng", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "area_locations", force: :cascade do |t|
    t.integer "area_id",     null: false
    t.integer "location_id", null: false
  end

  create_table "areas", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "name",                           null: false
    t.boolean  "is_public",       default: true, null: false
    t.string   "slug",                           null: false
    t.integer  "locations_count", default: 0
    t.index ["slug"], name: "index_areas_on_slug", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "location_maps", force: :cascade do |t|
    t.integer "map_id",                     null: false
    t.integer "location_id",                null: false
    t.integer "order"
    t.boolean "show_order",  default: true, null: false
  end

  create_table "location_social_sites", force: :cascade do |t|
    t.integer "location_id"
    t.integer "social_site_id"
    t.string  "url"
  end

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "address_id",        null: false
    t.string   "name",              null: false
    t.string   "slug",              null: false
    t.text     "description"
    t.float    "rating"
    t.text     "website"
    t.string   "review_url"
    t.string   "photo"
    t.string   "photo_src"
    t.string   "photo_src_url"
    t.text     "short_description"
    t.index ["address_id"], name: "index_locations_on_address_id", using: :btree
    t.index ["slug"], name: "index_locations_on_slug", using: :btree
  end

  create_table "maps", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "title",             null: false
    t.string   "short_title",       null: false
    t.string   "slug",              null: false
    t.text     "description",       null: false
    t.string   "photo"
    t.string   "photo_src"
    t.string   "photo_src_url"
    t.text     "short_description"
  end

  create_table "social_sites", force: :cascade do |t|
    t.string "name"
    t.string "slug"
  end

end
