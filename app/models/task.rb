class Task < ApplicationRecord
  belongs_to :user
  has_many :category_tasks, dependent: :destroy
  has_many :categories, through: :category_tasks
end
