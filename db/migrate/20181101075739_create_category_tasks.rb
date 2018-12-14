class CreateCategoryTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :category_tasks do |t|
      t.references :category, foreign_key: true, null: false
      t.references :task, foreign_key: true, null: false
    end
  end
end
