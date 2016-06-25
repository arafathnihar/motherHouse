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

ActiveRecord::Schema.define(version: 20160617155743) do

  create_table "agents", force: :cascade do |t|
    t.string   "customId",    limit: 12,              null: false
    t.integer  "mainAgentId", limit: 4,               null: false
    t.string   "name",        limit: 255,             null: false
    t.string   "contact",     limit: 15
    t.integer  "countryId",   limit: 4
    t.string   "guid",        limit: 255,             null: false
    t.integer  "status",      limit: 4,   default: 1, null: false
    t.integer  "created_by",  limit: 4,               null: false
    t.integer  "updated_by",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agents", ["countryId"], name: "fk_rails_1be7e95f6d", using: :btree
  add_index "agents", ["created_by"], name: "fk_rails_54f5e66766", using: :btree
  add_index "agents", ["mainAgentId"], name: "fk_rails_994f948e7d", using: :btree
  add_index "agents", ["updated_by"], name: "fk_rails_595c78de81", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string "code", limit: 5,   null: false
    t.string "name", limit: 100, null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string "code", limit: 5,   null: false
    t.string "name", limit: 150
  end

  create_table "main_agents", force: :cascade do |t|
    t.string   "customId",   limit: 12,              null: false
    t.string   "name",       limit: 255,             null: false
    t.string   "contact",    limit: 15
    t.integer  "countryId",  limit: 4
    t.string   "guid",       limit: 255,             null: false
    t.integer  "status",     limit: 4,   default: 1, null: false
    t.integer  "created_by", limit: 4,               null: false
    t.integer  "updated_by", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "main_agents", ["countryId"], name: "fk_rails_11927525f4", using: :btree
  add_index "main_agents", ["created_by"], name: "fk_rails_8ea842ae70", using: :btree
  add_index "main_agents", ["updated_by"], name: "fk_rails_e97058caf5", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "customId",         limit: 12,                             null: false
    t.integer  "agentId",          limit: 4,                              null: false
    t.integer  "receivingAgentId", limit: 4,                              null: false
    t.integer  "receiverId",       limit: 4,                              null: false
    t.decimal  "orderAmount",                  precision: 10,             null: false
    t.integer  "orderCurrId",      limit: 4,                              null: false
    t.integer  "supplyCurrId",     limit: 4,                              null: false
    t.decimal  "exchangeRate",                 precision: 10,             null: false
    t.datetime "orderDate",                                               null: false
    t.integer  "orderStatus",      limit: 4,                  default: 1, null: false
    t.datetime "settledDate",                                             null: false
    t.string   "guid",             limit: 255,                            null: false
    t.integer  "status",           limit: 4,                  default: 1, null: false
    t.integer  "created_by",       limit: 4,                              null: false
    t.integer  "updated_by",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["agentId"], name: "fk_rails_985a43261c", using: :btree
  add_index "orders", ["created_by"], name: "fk_rails_7b25bc2984", using: :btree
  add_index "orders", ["orderCurrId"], name: "fk_rails_ac970b6c1d", using: :btree
  add_index "orders", ["receiverId"], name: "fk_rails_a838d470a4", using: :btree
  add_index "orders", ["receivingAgentId"], name: "fk_rails_c5325c128c", using: :btree
  add_index "orders", ["supplyCurrId"], name: "fk_rails_8865b42ce6", using: :btree
  add_index "orders", ["updated_by"], name: "fk_rails_2d08b953e5", using: :btree

  create_table "receivers", force: :cascade do |t|
    t.string   "name",       limit: 255,             null: false
    t.string   "contact",    limit: 15
    t.integer  "countryId",  limit: 4
    t.string   "bankName",   limit: 255
    t.string   "branchName", limit: 255
    t.string   "bankAcNo",   limit: 255
    t.string   "guid",       limit: 255,             null: false
    t.integer  "status",     limit: 4,   default: 1, null: false
    t.integer  "created_by", limit: 4,               null: false
    t.integer  "updated_by", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "receivers", ["countryId"], name: "fk_rails_2287126da3", using: :btree
  add_index "receivers", ["created_by"], name: "fk_rails_814d560199", using: :btree
  add_index "receivers", ["updated_by"], name: "fk_rails_16a295911c", using: :btree

  create_table "receiving_agents", force: :cascade do |t|
    t.string   "customId",    limit: 12,  null: false
    t.integer  "mainAgentId", limit: 4,   null: false
    t.string   "name",        limit: 255, null: false
    t.string   "contact",     limit: 15
    t.integer  "countryId",   limit: 4
    t.string   "guid",        limit: 255, null: false
    t.integer  "created_by",  limit: 4,   null: false
    t.integer  "updated_by",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "receiving_agents", ["countryId"], name: "fk_rails_a2940fe016", using: :btree
  add_index "receiving_agents", ["created_by"], name: "fk_rails_48fbadfcd5", using: :btree
  add_index "receiving_agents", ["mainAgentId"], name: "fk_rails_459e6097f5", using: :btree
  add_index "receiving_agents", ["updated_by"], name: "fk_rails_44a595623d", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "customId",   limit: 12,              null: false
    t.string   "name",       limit: 255,             null: false
    t.string   "contact",    limit: 15
    t.string   "country",    limit: 150
    t.string   "username",   limit: 50,              null: false
    t.string   "password",   limit: 255,             null: false
    t.string   "guid",       limit: 255,             null: false
    t.integer  "status",     limit: 4,   default: 1, null: false
    t.integer  "created_by", limit: 4,               null: false
    t.integer  "updated_by", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["created_by"], name: "fk_rails_755543ca4d", using: :btree
  add_index "users", ["updated_by"], name: "fk_rails_8c1436a35d", using: :btree

  add_foreign_key "agents", "countries", column: "countryId"
  add_foreign_key "agents", "main_agents", column: "mainAgentId"
  add_foreign_key "agents", "users", column: "created_by"
  add_foreign_key "agents", "users", column: "updated_by"
  add_foreign_key "main_agents", "countries", column: "countryId"
  add_foreign_key "main_agents", "users", column: "created_by"
  add_foreign_key "main_agents", "users", column: "updated_by"
  add_foreign_key "orders", "agents", column: "agentId"
  add_foreign_key "orders", "currencies", column: "orderCurrId"
  add_foreign_key "orders", "currencies", column: "supplyCurrId"
  add_foreign_key "orders", "receivers", column: "receiverId"
  add_foreign_key "orders", "receiving_agents", column: "receivingAgentId"
  add_foreign_key "orders", "users", column: "created_by"
  add_foreign_key "orders", "users", column: "updated_by"
  add_foreign_key "receivers", "countries", column: "countryId"
  add_foreign_key "receivers", "users", column: "created_by"
  add_foreign_key "receivers", "users", column: "updated_by"
  add_foreign_key "receiving_agents", "countries", column: "countryId"
  add_foreign_key "receiving_agents", "main_agents", column: "mainAgentId"
  add_foreign_key "receiving_agents", "users", column: "created_by"
  add_foreign_key "receiving_agents", "users", column: "updated_by"
  add_foreign_key "users", "users", column: "created_by"
  add_foreign_key "users", "users", column: "updated_by"
end
