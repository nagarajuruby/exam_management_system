class UserExam < ApplicationRecord
  belongs_to :user
  belongs_to :exam

  validates :user_id, uniqueness: { scope: :exam_id }
end
