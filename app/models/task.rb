class Task < ApplicationRecord
  belongs_to :user
  has_many :category_tasks, dependent: :destroy
  has_many :categories, through: :category_tasks
  SEQUENCE = { '高' => 1, '中' => 2, '低' => 3 }
  STATUS = { '未着手' => 0, '着手中' => 1, '完了' => 2}
  validates :user_id, presence: true
  validates :sequence, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 3 }
  validates :status, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2 }
  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  VALID_DATETIME_REGEX = /\A[1-9]\d\d\d\-0?[1-9]|1[12]\-0?[1-9]|[12]\d|3[01] [01]?[0-9]|2[0-4]:[0-5]\d:[0-5]\d\z/
  validates :finished_at, presence: true, format: { with: VALID_DATETIME_REGEX }
end
