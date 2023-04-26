class Exam < ApplicationRecord
  belongs_to :college
  has_many :exam_windows
  has_many :user_exams
  has_many :users, through: :user_exams
end
