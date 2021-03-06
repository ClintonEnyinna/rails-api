class Task < ApplicationRecord
  validates :title, presence: true

  scope :completed, -> { where(completed: true) }
  scope :uncompleted, -> { where(completed: false) }

  belongs_to :user
end
