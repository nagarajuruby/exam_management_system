class CreateApiRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :api_requests do |t|
      t.string :verb
      t.string :path
      t.integer :status

      t.timestamps
    end
  end
end
