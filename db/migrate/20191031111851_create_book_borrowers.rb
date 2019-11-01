class CreateBookBorrowers < ActiveRecord::Migration[5.2]
  def change
    create_table :book_borrowers do |t|
      t.references :book, foreign_key: true
      t.references :borrower, foreign_key: true

      t.timestamps
    end
  end
end
