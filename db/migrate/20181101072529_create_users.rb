class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 20, default: ''
      t.boolean :admin, null: false, default: false
      t.timestamps

      t.string :email, null: false, default: ''
      t.string :password_digest, null: false, default: ''
      t.datetime :remember_created_at

      # アカウントをアクティブにする
      t.string :activation_digest
      t.boolean :activated, null: false, default: false
      t.datetime :actived_at
      
      # パスワードをリセットする
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
    end
  end
end
