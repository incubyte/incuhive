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

ActiveRecord::Schema[7.0].define(version: 2024_07_28_101015) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "current_role"
    t.string "applied_role"
    t.string "location"
    t.integer "total_experience"
    t.integer "relevant_experience"
    t.string "skills", default: [], array: true
    t.integer "notice_period"
    t.string "resume_link"
    t.string "linkedin_link"
    t.string "github_link"
    t.string "repo_link"
    t.string "company_name"
    t.text "feedback"
    t.boolean "offer_given"
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_candidates_on_organization_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.string "round"
    t.boolean "verdict"
    t.text "feedback"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.string "invite_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invite_code"], name: "index_organizations_on_invite_code", unique: true
    t.index ["name"], name: "index_organizations_on_name", unique: true
  end

  create_table "panelists", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.string "name"
    t.string "available_time_slots", default: [], array: true
    t.string "expertise", default: [], array: true
    t.text "bio"
    t.index ["email"], name: "index_panelists_on_email", unique: true
    t.index ["organization_id"], name: "index_panelists_on_organization_id"
    t.index ["reset_password_token"], name: "index_panelists_on_reset_password_token", unique: true
  end

  add_foreign_key "candidates", "organizations"
  add_foreign_key "panelists", "organizations"
end
