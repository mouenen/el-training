class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.datetime :created_at, null: false
      t.datetime :finished_at, null: false
      t.integer :priority, null: false, default: '' # 優先順位（高中低）
      t.integer :status, null: false, default: 0 # 0: 未着手, 1: 着手中, 2: 完了
      t.string :title, null: false, default: '', limit: 30
      t.text :content, null: false, default: ''

      t.references :user, foreign_key: true, null: false

      t.index %i[user_id], name: 'index_tasks', unique: false
    end
  end
end
