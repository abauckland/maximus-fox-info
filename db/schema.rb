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

ActiveRecord::Schema.define(version: 20160423082729) do

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characs", force: true do |t|
    t.integer  "instance_id"
    t.integer  "perform_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "characs", ["instance_id"], name: "INSTANCE", using: :btree
  add_index "characs", ["perform_id"], name: "PERFORM", using: :btree

  create_table "clauselines", force: true do |t|
    t.integer  "subclause_id"
    t.integer  "clauseline"
    t.integer  "linetype_id"
    t.string   "txt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clauselines", ["subclause_id"], name: "SUBCLAUSE", using: :btree

  create_table "clauselinevalues", force: true do |t|
    t.integer  "clauseline_id"
    t.integer  "linevalue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clauselinevalues", ["clauseline_id"], name: "CLAUSELINE", using: :btree

  create_table "clausetypes", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guides", force: true do |t|
    t.string   "text"
    t.integer  "preamble_id"
    t.integer  "postscript_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identities", force: true do |t|
    t.integer  "identkey_id"
    t.integer  "identvalue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["identkey_id"], name: "KEY", using: :btree
  add_index "identities", ["identvalue_id"], name: "VALUE", using: :btree

  create_table "identkeys", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identtxts", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identvalues", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "text"
  end

  create_table "instances", force: true do |t|
    t.integer  "product_id"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "instances", ["product_id"], name: "PRODUCT", using: :btree

  create_table "itemitems", force: true do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "title"
    t.integer  "guide_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["title"], name: "TITLE", unique: true, using: :btree

  create_table "itemsubclauses", force: true do |t|
    t.integer  "subclause_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "itemsubclauses", ["item_id"], name: "ITEM", using: :btree
  add_index "itemsubclauses", ["subclause_id"], name: "SUBCLAUSE", using: :btree

  create_table "linetypes", force: true do |t|
    t.integer  "level"
    t.boolean  "txt"
    t.boolean  "input"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "linevalues", force: true do |t|
    t.integer  "standarditem_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "performkeys", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "performs", force: true do |t|
    t.integer  "performkey_id"
    t.integer  "performvalue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "performs", ["performkey_id"], name: "PERFORMKEY", using: :btree

  create_table "performvalues", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "postscripts", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preambles", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "productidentities", force: true do |t|
    t.integer  "identity_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.integer  "range_id"
    t.string   "ref"
    t.string   "name"
  end

  add_index "products", ["company_id"], name: "COMPANIES", using: :btree
  add_index "products", ["item_id"], name: "ITEMS", using: :btree
  add_index "products", ["range_id"], name: "RANGES", using: :btree

  create_table "subclauses", force: true do |t|
    t.integer  "guide_id"
    t.string   "title"
    t.string   "descript1"
    t.string   "descript2"
    t.integer  "clausetype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subclauses", ["clausetype_id"], name: "CLAUSETYPE", using: :btree
  add_index "subclauses", ["title"], name: "TITLE", unique: true, using: :btree

  create_table "txts", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
