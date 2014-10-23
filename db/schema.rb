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

ActiveRecord::Schema.define(version: 20141020190959) do

  create_table "competences", force: true do |t|
    t.string   "name_competence"
    t.string   "type_competence"
    t.integer  "auto_evaluation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active_competence"
  end

  add_index "competences", ["auto_evaluation_id"], name: "index_competences_on_auto_evaluation_id"

  create_table "competences_forms", id: false, force: true do |t|
    t.integer "competence_id"
    t.integer "form_id"
  end

  create_table "evaluation_periods", force: true do |t|
    t.date     "start_date_evaluation", limit: 255
    t.date     "end_date_evaluation",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "evaluations", force: true do |t|
    t.string   "evaluation_date"
    t.string   "observations_evaluated"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "form_id"
  end

  add_index "evaluations", ["form_id"], name: "index_evaluations_on_form_id"
  add_index "evaluations", ["user_id"], name: "index_evaluations_on_user_id"

  create_table "forms", force: true do |t|
    t.datetime "date"
  end

  create_table "forms_goals", id: false, force: true do |t|
    t.integer "form_id"
    t.integer "goal_id"
  end

  create_table "forms_working_conditions", id: false, force: true do |t|
    t.integer "form_id"
    t.integer "working_condition_id"
  end

  create_table "goals", force: true do |t|
    t.string   "name_goal"
    t.text     "description_goal", limit: 255
    t.string   "value_goal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "deadline_goal"
  end

  create_table "learning_solutions", force: true do |t|
    t.string   "description"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active_learning_solution"
  end

  create_table "phases", force: true do |t|
    t.date    "start_date_phase",     limit: 255, default: '2014-04-12'
    t.date    "end_date_phase",       limit: 255, default: '2014-05-12'
    t.string  "status_phase"
    t.integer "evaluation_period_id"
    t.string  "phase_name"
    t.text    "phase_description"
  end

  add_index "phases", ["evaluation_period_id"], name: "index_phases_on_evaluation_period_id"

  create_table "users", force: true do |t|
    t.string   "name_user"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "job_title"
    t.string   "cost_center"
    t.string   "fub_registry"
    t.string   "siape_registry"
    t.date     "admission_date"
    t.string   "password_digest"
    t.boolean  "is_active_user"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "working_conditions", force: true do |t|
    t.string   "name_working_condition"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active_condition"
    t.boolean  "is_active_working_condition"
  end

end
