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

ActiveRecord::Schema.define(version: 20131219172732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "site_load_profiles", force: true do |t|
    t.date     "meter_read_date"
    t.string   "tou"
    t.decimal  "demand"
    t.decimal  "usage"
    t.datetime "interval_date_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
    t.string   "data_source"
    t.decimal  "all_usage"
    t.decimal  "on_peak_usage"
    t.decimal  "part_peak_usage"
    t.decimal  "off_peak_usage"
    t.decimal  "all_demand"
    t.decimal  "on_peak_demand"
    t.decimal  "part_peak_demand"
    t.decimal  "off_peak_demand"
  end

  create_table "sites", force: true do |t|
    t.string   "site_name"
    t.string   "company"
    t.string   "industry_type"
    t.string   "building_type"
    t.string   "description"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "square_feet"
    t.string   "phases"
    t.integer  "user_id"
    t.binary   "site_saved"
    t.boolean  "is_site_saved"
  end

  create_table "tariff_bill_groups", force: true do |t|
    t.string   "bill_group_name"
    t.integer  "bill_group_order"
    t.integer  "tariff_billing_class_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariff_billing_classes", force: true do |t|
    t.string   "billing_class_name"
    t.string   "customer_type"
    t.string   "phases"
    t.string   "voltage"
    t.string   "units"
    t.float    "start_value"
    t.float    "end_value"
    t.integer  "tariff_territory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariff_holidays", force: true do |t|
    t.string   "holiday_name"
    t.date     "holiday_date"
    t.integer  "tariff_territory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariff_indexed_rates", force: true do |t|
    t.float    "additional_charge"
    t.integer  "tariff_line_item_id"
    t.integer  "tariff_iso_lmp_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariff_iso_lmps", force: true do |t|
    t.string   "iso_rto"
    t.string   "hub"
    t.string   "da_rt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariff_line_items", force: true do |t|
    t.string   "line_item_name"
    t.string   "line_item_type"
    t.date     "effective_date"
    t.date     "expiration_date"
    t.float    "line_item_rate"
    t.string   "tou_type"
    t.integer  "bill_group_order"
    t.integer  "tariff_tariff_id"
    t.integer  "tariff_season_id"
    t.integer  "tariff_bill_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariff_lmp_rates", force: true do |t|
    t.date     "lmp_date"
    t.time     "lmp_time"
    t.float    "lmp_factor"
    t.integer  "tariff_iso_lmp_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariff_load_classes", force: true do |t|
    t.string   "load_class_name"
    t.string   "customer_type"
    t.string   "voltage"
    t.string   "load_class_units"
    t.float    "load_class_start"
    t.float    "load_class_end"
    t.string   "weather_zone"
    t.integer  "tariff_territory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariff_meter_reads", force: true do |t|
    t.date     "meter_read_date"
    t.string   "billing_month"
    t.string   "billing_year"
    t.integer  "tariff_territory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariff_muni_franchise_costs", force: true do |t|
    t.string   "fca_city"
    t.float    "fca_rate"
    t.integer  "tariff_line_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariff_seasons", force: true do |t|
    t.string   "season_type"
    t.date     "season_start_date"
    t.date     "season_end_date"
    t.integer  "tariff_territory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariff_settlement_load_profiles", force: true do |t|
    t.string   "slp_date"
    t.time     "slp_time"
    t.float    "slp_factor"
    t.integer  "tariff_load_class_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariff_stepped_rates", force: true do |t|
    t.string   "stepped_rates_unit"
    t.float    "stepped_rates_start"
    t.float    "stepped_rates_end"
    t.float    "stepped_rates_rate"
    t.string   "stepped_rates_city"
    t.integer  "tariff_line_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariff_tariffs", force: true do |t|
    t.string   "tariff_name"
    t.string   "tariff_type"
    t.integer  "tariff_billing_class_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariff_territories", force: true do |t|
    t.string   "territory_name"
    t.integer  "tariff_utility_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tariff_territories", ["tariff_utility_id"], name: "index_tariff_territories_on_tariff_utility_id", using: :btree

  create_table "tariff_territory_zip_code_rels", force: true do |t|
    t.integer  "tariff_territory_id"
    t.integer  "tariff_zip_code_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariff_tous", force: true do |t|
    t.string   "tou_type"
    t.string   "day_of_week"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "tariff_seasons_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariff_utilities", force: true do |t|
    t.string   "utility_name"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariff_zip_codes", force: true do |t|
    t.string   "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usage_fetchers", force: true do |t|
    t.string   "account_no"
    t.string   "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "company"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
