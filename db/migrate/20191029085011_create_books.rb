class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :ISBN, null: false
      t.string :name, null: false
      t.string :author, null: false
      t.string :publisher, null: false
      t.references :owner, foreign_key: true

      t.timestamps
    end
    add_index :books, [:owner_id, :created_at]
  end
end
