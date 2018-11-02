# el-training

Ruby on Railsとその周辺技術の基礎を習得するための研修カリキュラム。

## データベース

データベースはPostgreSQLです。

- 開発用
  - el_training_development
- テスト用
  - el_training_test

## テーブル

- users
  - column
    t.string "name", limit: 20, default: "", null: false
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.string "activation_digest"
    t.boolean "activated", default: false, null: false
    t.datetime "actived_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"

- tasks
  - column
    t.datetime "created_at", null: false
    t.datetime "finished_at", null: false
    t.integer "sequence", default: 0, null: false
    t.integer "status", default: -1, null: false
    t.string "title", limit: 30, default: "", null: false
    t.text "content", default: "", null: false
    t.bigint "user_id", null: false
  - index
    t.index ["user_id"], name: "index_tasks_on_user_id"
    t.index ["user_id"], name: "index_tasks_uniqueness", unique: true
  - foreign key
    "fk_rails_4d2a9e4d7e" FOREIGN KEY (user_id) REFERENCES users(id)

- categories
  - column
    t.string "name"
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false

- category_tasks
  - column
    t.bigint "category_id", null: false
    t.bigint "task_id", null: false
  - index
    t.index ["category_id"], name: "index_category_tasks_on_category_id"
    t.index ["task_id"], name: "index_category_tasks_on_task_id"
  - foreign key
    "fk_rails_455941be2e" FOREIGN KEY (category_id) REFERENCES categories(id)
    "fk_rails_9efd72a0c7" FOREIGN KEY (task_id) REFERENCES tasks(id)

