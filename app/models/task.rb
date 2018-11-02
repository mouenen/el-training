class Task < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :category_tasks, dependent: :destroy
  has_many :categories, through: :category_tasks
end
