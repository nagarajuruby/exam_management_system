class CreateUserExams < ActiveRecord::Migration[7.0]
  def change
    create_table :user_exams do |t|
      t.references :user, null: false
      t.references :exam, null: false

      t.timestamps
    end
  end
end
