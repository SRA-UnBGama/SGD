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

ActiveRecord::Schema.define(version: 20140917172253) do

  create_table "competences", force: true do |t|
    t.string   "name_competence"
    t.string   "description_competence"
    t.string   "value_competence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competences_forms", id: false, force: true do |t|
    t.integer "competence_id"
    t.integer "form_id"
  end

  create_table "evaluation_periods", force: true do |t|
    t.string   "start_date_evaluation"
    t.string   "end_date_evaluation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "evaluations", force: true do |t|
    t.string   "evaluation_date"
    t.string   "observations_evaluated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "evaluations_users", id: false, force: true do |t|
    t.integer "evaluation_id"
    t.integer "user_id"
  end

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

  create_table "phases", force: true do |t|
    t.string   "start_date_phase"
    t.string   "end_date_phase"
    t.string   "status_phase"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "evaluation_period_id"
  end

  create_table "users", force: true do |t|
    t.string   "name_user"
    t.string   "registry_user"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "working_conditions", force: true do |t|
    t.string   "name_working_condition"
    t.string   "description_working_condition"
    t.string   "value_working_condition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
