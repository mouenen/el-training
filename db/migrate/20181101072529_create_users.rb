class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 20, default: ''
      t.boolean :admin, null: false, default: false
      t.timestamps

      t.string :email, null: false, default: ''
      t.string :password_digest, null: false, default: ''
      t.string :remember_digest

      # アカウントをアクティブにする
      t.string :activation_digest
      t.boolean :activated, null: false, default: false
      t.datetime :activated_at
      
      # パスワードをリセットする
      t.string   :reset_digest
      t.datetime :reset_sent_at
    end
  end
end
