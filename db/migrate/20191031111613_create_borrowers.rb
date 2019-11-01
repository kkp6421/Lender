class CreateBorrowers < ActiveRecord::Migration[5.2]
  def change
    create_table :borrowers do |t|
      t.string :name, null: false
      t.string :twitter_id, null: false

      t.timestamps
    end
  end
end
