class Task < ApplicationRecord
  belongs_to :user
  has_many :category_tasks, dependent: :destroy
  has_many :categories, through: :category_tasks
  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  VALID_DATETIME_REGEX = /\A([1-9]\d\d\d\-0?[1-9]|1[12]\-0?[1-9]|[12]\d|3[01]) ([01]?[1-9]|2[0-4]:[0-5]\d:[0-5]\d)\z/
  validates :finished_at, presence: true, format: { with: VALID_DATETIME_REGEX }
end
