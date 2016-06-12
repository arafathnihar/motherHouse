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

ActiveRecord::Schema.define(version: 20160612101022) do

  create_table "agent_accounts", force: :cascade do |t|
    t.integer  "agentId",     limit: 4,                              null: false
    t.decimal  "amount",                  precision: 10,             null: false
    t.datetime "date",                                               null: false
    t.integer  "bDownStatus", limit: 4,                  default: 1, null: false
    t.string   "guid",        limit: 255,                            null: false
    t.integer  "status",      limit: 4,                  default: 1, null: false
    t.integer  "created_by",  limit: 4,                              null: false
    t.integer  "updated_by",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agent_accounts", ["agentId"], name: "fk_rails_1096d04e57", using: :btree
  add_index "agent_accounts", ["created_by"], name: "fk_rails_21b8eabad7", using: :btree
  add_index "agent_accounts", ["updated_by"], name: "fk_rails_00c3ad38fa", using: :btree

  create_table "agents", force: :cascade do |t|
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

  add_index "agents", ["countryId"], name: "fk_rails_1be7e95f6d", using: :btree
  add_index "agents", ["created_by"], name: "fk_rails_54f5e66766", using: :btree
  add_index "agents", ["updated_by"], name: "fk_rails_595c78de81", using: :btree

  create_table "client_accounts", force: :cascade do |t|
    t.integer  "clientId",    limit: 4,                              null: false
    t.decimal  "amount",                  precision: 10,             null: false
    t.datetime "date",                                               null: false
    t.integer  "bDownStatus", limit: 4,                  default: 1, null: false
    t.string   "guid",        limit: 255,                            null: false
    t.integer  "status",      limit: 4,                  default: 1, null: false
    t.integer  "created_by",  limit: 4,                              null: false
    t.integer  "updated_by",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "client_accounts", ["clientId"], name: "fk_rails_efa93b6e1f", using: :btree
  add_index "client_accounts", ["created_by"], name: "fk_rails_0f48d3b279", using: :btree
  add_index "client_accounts", ["updated_by"], name: "fk_rails_e42bf95574", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "customId",   limit: 12,              null: false
    t.integer  "agentId",    limit: 4,               null: false
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

  add_index "clients", ["agentId"], name: "fk_rails_63c1a3925a", using: :btree
  add_index "clients", ["countryId"], name: "fk_rails_ebaf1addd0", using: :btree
  add_index "clients", ["created_by"], name: "fk_rails_ff27cb5f5b", using: :btree
  add_index "clients", ["updated_by"], name: "fk_rails_2b73b8b268", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string "code", limit: 5,   null: false
    t.string "name", limit: 100, null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string "code", limit: 5,   null: false
    t.string "name", limit: 150
  end

  create_table "receivers", force: :cascade do |t|
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

  add_index "receivers", ["countryId"], name: "fk_rails_2287126da3", using: :btree
  add_index "receivers", ["created_by"], name: "fk_rails_814d560199", using: :btree
  add_index "receivers", ["updated_by"], name: "fk_rails_16a295911c", using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "clientId",     limit: 4,                              null: false
    t.decimal  "orderAmount",              precision: 10,             null: false
    t.integer  "orderCurrId",  limit: 4,                              null: false
    t.integer  "supplyCurrId", limit: 4,                              null: false
    t.decimal  "exchangeRate",             precision: 10,             null: false
    t.datetime "date",                                                null: false
    t.string   "guid",         limit: 255,                            null: false
    t.integer  "status",       limit: 4,                  default: 1, null: false
    t.integer  "created_by",   limit: 4,                              null: false
    t.integer  "updated_by",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requests", ["clientId"], name: "fk_rails_64ed9badb9", using: :btree
  add_index "requests", ["created_by"], name: "fk_rails_30ac3c50e5", using: :btree
  add_index "requests", ["orderCurrId"], name: "fk_rails_5da4a923d2", using: :btree
  add_index "requests", ["supplyCurrId"], name: "fk_rails_0bc50466f9", using: :btree
  add_index "requests", ["updated_by"], name: "fk_rails_964e6827be", using: :btree

  create_table "responses", force: :cascade do |t|
    t.integer  "subAgentId",     limit: 4,                              null: false
    t.integer  "receiverId",     limit: 4,                              null: false
    t.integer  "requestId",      limit: 4,                              null: false
    t.decimal  "supplyAmount",               precision: 10,             null: false
    t.integer  "supplyCurrId",   limit: 4,                              null: false
    t.datetime "date",                                                  null: false
    t.integer  "responseStatus", limit: 4,                  default: 1, null: false
    t.string   "guid",           limit: 255,                            null: false
    t.integer  "status",         limit: 4,                  default: 1, null: false
    t.integer  "created_by",     limit: 4,                              null: false
    t.integer  "updated_by",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responses", ["created_by"], name: "fk_rails_7927facff0", using: :btree
  add_index "responses", ["receiverId"], name: "fk_rails_43945a0892", using: :btree
  add_index "responses", ["requestId"], name: "fk_rails_8d44c32872", using: :btree
  add_index "responses", ["subAgentId"], name: "fk_rails_2fcc75d3d3", using: :btree
  add_index "responses", ["supplyCurrId"], name: "fk_rails_44c222f66e", using: :btree
  add_index "responses", ["updated_by"], name: "fk_rails_10bfad987c", using: :btree

  create_table "sub_agents", force: :cascade do |t|
    t.string   "customId",   limit: 12,  null: false
    t.integer  "agentId",    limit: 4,   null: false
    t.string   "name",       limit: 255, null: false
    t.string   "contact",    limit: 15
    t.integer  "countryId",  limit: 4
    t.string   "guid",       limit: 255, null: false
    t.integer  "created_by", limit: 4,   null: false
    t.integer  "updated_by", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_agents", ["agentId"], name: "fk_rails_cc491c8f37", using: :btree
  add_index "sub_agents", ["countryId"], name: "fk_rails_d417ebd980", using: :btree
  add_index "sub_agents", ["created_by"], name: "fk_rails_9adbade4f7", using: :btree
  add_index "sub_agents", ["updated_by"], name: "fk_rails_9af8e61a9c", using: :btree

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

  add_foreign_key "agent_accounts", "agents", column: "agentId"
  add_foreign_key "agent_accounts", "users", column: "created_by"
  add_foreign_key "agent_accounts", "users", column: "updated_by"
  add_foreign_key "agents", "countries", column: "countryId"
  add_foreign_key "agents", "users", column: "created_by"
  add_foreign_key "agents", "users", column: "updated_by"
  add_foreign_key "client_accounts", "clients", column: "clientId"
  add_foreign_key "client_accounts", "users", column: "created_by"
  add_foreign_key "client_accounts", "users", column: "updated_by"
  add_foreign_key "clients", "agents", column: "agentId"
  add_foreign_key "clients", "countries", column: "countryId"
  add_foreign_key "clients", "users", column: "created_by"
  add_foreign_key "clients", "users", column: "updated_by"
  add_foreign_key "receivers", "countries", column: "countryId"
  add_foreign_key "receivers", "users", column: "created_by"
  add_foreign_key "receivers", "users", column: "updated_by"
  add_foreign_key "requests", "clients", column: "clientId"
  add_foreign_key "requests", "currencies", column: "orderCurrId"
  add_foreign_key "requests", "currencies", column: "supplyCurrId"
  add_foreign_key "requests", "users", column: "created_by"
  add_foreign_key "requests", "users", column: "updated_by"
  add_foreign_key "responses", "currencies", column: "supplyCurrId"
  add_foreign_key "responses", "receivers", column: "receiverId"
  add_foreign_key "responses", "requests", column: "requestId"
  add_foreign_key "responses", "sub_agents", column: "subAgentId"
  add_foreign_key "responses", "users", column: "created_by"
  add_foreign_key "responses", "users", column: "updated_by"
  add_foreign_key "sub_agents", "agents", column: "agentId"
  add_foreign_key "sub_agents", "countries", column: "countryId"
  add_foreign_key "sub_agents", "users", column: "created_by"
  add_foreign_key "sub_agents", "users", column: "updated_by"
  add_foreign_key "users", "users", column: "created_by"
  add_foreign_key "users", "users", column: "updated_by"
end
