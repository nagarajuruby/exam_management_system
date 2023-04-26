# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

unless College.any?
  college_names = ['ABC Institute', 'XYZ University']
  college_names.each do |name|
    College.create(name: name)
  end
end

if College.any?
  college = College.first
  exam = college.exams.create!(name: 'Example Exam')

  exam_window = exam.exam_windows.create!(
    start_time: (DateTime.now+1.month).at_beginning_of_month,
    end_time: (DateTime.now+1.month).at_beginning_of_month.end_of_day
  )

  user = User.create!(
    first_name: 'John',
    last_name: 'Doe',
    phone_number: '123-456-7890'
  )

  user.user_exams.create!(exam: exam)
end

