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

ActiveRecord::Schema.define(version: 2021_02_24_164518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dim_customers", force: :cascade do |t|
    t.date "Creation_Date"
    t.string "Company_name"
    t.string "FN_Cpy_main_ct"
    t.string "Email_Cpy_man_ct"
    t.integer "NbElevators"
    t.string "CustomerCity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fact_contacts", force: :cascade do |t|
    t.integer "ContactId"
    t.date "Creation_Date"
    t.string "Company_name"
    t.string "Email"
    t.string "Project_Name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fact_elevators", force: :cascade do |t|
    t.string "SerialNumber"
    t.date "Date_Commissioning"
    t.integer "BuildingId"
    t.integer "CustomerId"
    t.string "Building_City"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fact_quotes", force: :cascade do |t|
    t.integer "QuoteId"
    t.date "Creation"
    t.string "Company_Name"
    t.string "Email"
    t.integer "NbElevator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
