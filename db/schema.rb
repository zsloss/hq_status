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

ActiveRecord::Schema.define(version: 20150416145841) do

  create_table "tasks", force: :cascade do |t|
    t.string   "flow"
    t.string   "product"
    t.string   "doc_type"
    t.date     "start_date"
    t.string   "revision"
    t.string   "version"
    t.string   "status"
    t.string   "region"
    t.boolean  "done"
    t.integer  "draft"
    t.date     "draft_submitted"
    t.date     "completion_date"
    t.text     "notes"
    t.integer  "writer_id"
    t.integer  "reviewer_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "review_status"
    t.date     "review_sent_date"
    t.date     "review_date"
  end

  add_index "tasks", ["review_status"], name: "index_tasks_on_review_status"
  add_index "tasks", ["reviewer_id"], name: "index_tasks_on_reviewer_id"
  add_index "tasks", ["writer_id"], name: "index_tasks_on_writer_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true

end
