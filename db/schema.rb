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

ActiveRecord::Schema.define(version: 20170901035503) do

  create_table "filterings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "service_provider"
    t.string "degree"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_filterings_on_user_id"
  end

  create_table "identities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "media", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "category"
    t.string "program_name"
    t.string "thumbnail"
    t.string "local_file"
    t.datetime "register_date_time"
    t.datetime "last_saved_date_time"
    t.string "assigned_user"
    t.string "status"
    t.string "audio_file"
  end

  create_table "other_queries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "query"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_other_queries_on_user_id"
  end

  create_table "preference_surveys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "media_id"
    t.bigint "shot_id"
    t.string "program_name"
    t.float "preference", limit: 24
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_id"], name: "index_preference_surveys_on_media_id"
    t.index ["shot_id"], name: "index_preference_surveys_on_shot_id"
    t.index ["user_id"], name: "index_preference_surveys_on_user_id"
  end

  create_table "shots", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "media_id"
    t.integer "shot_num"
    t.integer "start_frame"
    t.integer "end_frame"
    t.string "start_thumb"
    t.string "end_thumb"
    t.string "start_time_code"
    t.string "end_time_code"
    t.index ["media_id"], name: "index_shots_on_media_id"
  end

  create_table "start_queries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "query"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_start_queries_on_user_id"
  end

  create_table "start_query_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "start_query_id"
    t.bigint "shot_id"
    t.string "tag_desc"
    t.integer "tag_id"
    t.integer "tag_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shot_id"], name: "index_start_query_tags_on_shot_id"
    t.index ["start_query_id"], name: "index_start_query_tags_on_start_query_id"
  end

  create_table "stories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "start_query_id"
    t.integer "second_query_id"
    t.integer "third_query_id"
    t.integer "fourth_query_id"
    t.integer "fifth_query_id"
    t.float "final_score", limit: 24
    t.string "title"
    t.integer "content_type"
    t.string "mash_up_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["start_query_id"], name: "index_stories_on_start_query_id"
    t.index ["user_id"], name: "index_stories_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", limit: 10
    t.date "birthday"
    t.string "sex", limit: 2
    t.boolean "married"
    t.boolean "children"
    t.string "job", limit: 50
    t.string "hobby", limit: 50
    t.string "phone", limit: 15
    t.string "company", limit: 50
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "filterings", "users"
  add_foreign_key "identities", "users"
  add_foreign_key "other_queries", "users"
  add_foreign_key "preference_surveys", "media", column: "media_id"
  add_foreign_key "preference_surveys", "shots"
  add_foreign_key "preference_surveys", "users"
  add_foreign_key "shots", "media", column: "media_id"
  add_foreign_key "start_queries", "users"
  add_foreign_key "start_query_tags", "shots"
  add_foreign_key "start_query_tags", "start_queries"
  add_foreign_key "stories", "start_queries"
  add_foreign_key "stories", "users"
end
