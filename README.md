# el-training

Ruby on Railsとその周辺技術の基礎を習得するための研修カリキュラム。

## Vue.jsの使用環境を構造する

- yarnをインストールする

  - [インストール方法](https://yarnpkg.com/lang/en/docs/install/#debian-stable)

- Webpackをインストールする

  - [インストール方法](https://github.com/rails/webpacker)

- Vue.jsをインストールする

  '''
    gem 'vuejs-rails'
    gem 'webpacker', '~> 3.5'
  '''
  '''
    bin/bundle install
    bin/rails webpacker:install:vue
  '''

## データベース

データベースはPostgreSQLです。

- 開発用
  - el_training_development
- テスト用
  - el_training_test

## テーブル

- users
        Column     |            Type             | Nullable |              Default
-------------------+-----------------------------+----------+----------------------------------
 id                | bigint                      | not null | nextval('users_id_seq'::regclass)
 name              | character varying(20)       | not null | ''::character varying
 admin             | boolean                     | not null | false
 created_at        | timestamp without time zone | not null | 
 updated_at        | timestamp without time zone | not null | 
 email             | character varying           | not null | ''::character varying
 password_digest   | character varying           | not null | ''::character varying
 remember_digest   | character varying           |          | 
 activation_digest | character varying           |          | 
 activated         | boolean                     | not null | false
 activated_at      | timestamp without time zone |          | 
 reset_digest      | character varying           |          | 
 reset_sent_at     | timestamp without time zone |          | 
```
Indexes:
    "users_pkey" PRIMARY KEY, btree (id)
Referenced by:
    TABLE "tasks" CONSTRAINT "fk_rails_4d2a9e4d7e" FOREIGN KEY (user_id) REFERENCES users(id)
```

- tasks
   Column    |            Type             | Nullable |              Default
-------------+-----------------------------+----------+----------------------------------
 id          | bigint                      | not null | nextval('tasks_id_seq'::regclass)
 created_at  | timestamp without time zone | not null | 
 finished_at | timestamp without time zone | not null | 
 priority    | integer                     | not null | 
 status      | integer                     | not null | 0
 title       | character varying(30)       | not null | ''::character varying
 content     | text                        | not null | ''::text
 user_id     | bigint                      | not null | 
```
Indexes:
    "tasks_pkey" PRIMARY KEY, btree (id)
    "index_tasks" btree (user_id)
    "index_tasks_on_user_id" btree (user_id)
Foreign-key constraints:
    "fk_rails_4d2a9e4d7e" FOREIGN KEY (user_id) REFERENCES users(id)
Referenced by:
    TABLE "category_tasks" CONSTRAINT "fk_rails_9efd72a0c7" FOREIGN KEY (task_id) REFERENCES tasks(id)
```

- categories
   Column   |            Type             | Nullable |                Default                 
------------+-----------------------------+----------+---------------------------------------
 id         | bigint                      | not null | nextval('categories_id_seq'::regclass)
 name       | character varying           |          | 
 desc       | character varying           |          | 
 created_at | timestamp without time zone | not null | 
 updated_at | timestamp without time zone | not null | 
```
Indexes:
    "categories_pkey" PRIMARY KEY, btree (id)
Referenced by:
    TABLE "category_tasks" CONSTRAINT "fk_rails_455941be2e" FOREIGN KEY (category_id) REFERENCES categories(id)
```

- category_tasks
   Column    |  Type  | Nullable |                  Default                   
-------------+--------+----------+-------------------------------------------
 id          | bigint | not null | nextval('category_tasks_id_seq'::regclass)
 category_id | bigint | not null | 
 task_id     | bigint | not null | 
```
Indexes:
    "category_tasks_pkey" PRIMARY KEY, btree (id)
    "index_category_tasks_on_category_id" btree (category_id)
    "index_category_tasks_on_task_id" btree (task_id)
Foreign-key constraints:
    "fk_rails_455941be2e" FOREIGN KEY (category_id) REFERENCES categories(id)
    "fk_rails_9efd72a0c7" FOREIGN KEY (task_id) REFERENCES tasks(id)
```