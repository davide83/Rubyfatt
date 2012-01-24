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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120123191832) do

  create_table "consolidated_taxes", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
  end

  create_table "customers", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "name"
    t.string   "surname"
    t.string   "address"
    t.string   "zip_code"
    t.string   "town"
    t.string   "province"
    t.string   "country"
    t.string   "tax_code"
    t.string   "vat"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "estimates", :force => true do |t|
    t.integer  "customers_id"
    t.date     "date"
    t.integer  "year"
    t.integer  "number"
    t.boolean  "invoiced"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "invoices", :force => true do |t|
    t.integer  "customers_id"
    t.date     "date"
    t.integer  "year"
    t.integer  "number"
    t.boolean  "paid"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "options", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
    t.string  "value"
    t.boolean "integer"
  end

  create_table "slips", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "estimate_id"
    t.integer  "invoice_id"
    t.integer  "consolidated_tax_id"
    t.string   "name"
    t.integer  "price_cents",         :default => 0, :null => false
    t.string   "currency"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "taxes", :force => true do |t|
    t.integer "consolidated_tax_id"
    t.integer "user_id"
    t.integer "order"
    t.string  "name"
    t.integer "rate"
    t.boolean "compound"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "address"
    t.string   "zip_code"
    t.string   "town"
    t.string   "province"
    t.string   "country"
    t.string   "tax_code"
    t.string   "vat"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end