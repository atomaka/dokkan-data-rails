# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151008192100) do

  create_table "awaken_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "rarity_id"
    t.integer  "type_id"
    t.integer  "leader_skill_id"
    t.integer  "passive_skill_id"
    t.integer  "super_attack_id"
    t.integer  "dokkan_id"
    t.string   "title"
    t.string   "gameid",           default: "0000000"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "awaken_type_id"
  end

  add_index "cards", ["awaken_type_id"], name: "index_cards_on_awaken_type_id"
  add_index "cards", ["character_id"], name: "index_cards_on_character_id"
  add_index "cards", ["dokkan_id"], name: "index_cards_on_dokkan_id"
  add_index "cards", ["leader_skill_id"], name: "index_cards_on_leader_skill_id"
  add_index "cards", ["passive_skill_id"], name: "index_cards_on_passive_skill_id"
  add_index "cards", ["rarity_id"], name: "index_cards_on_rarity_id"
  add_index "cards", ["super_attack_id"], name: "index_cards_on_super_attack_id"
  add_index "cards", ["type_id"], name: "index_cards_on_type_id"

  create_table "cards_links", id: false, force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cards_links", ["card_id"], name: "index_cards_links_on_card_id"
  add_index "cards_links", ["link_id"], name: "index_cards_links_on_link_id"

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leader_skills", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "links", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "medals", force: :cascade do |t|
    t.string   "name"
    t.text     "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passive_skills", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rarities", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "super_attacks", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "nickname"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
