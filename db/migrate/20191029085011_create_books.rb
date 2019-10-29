class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :ISBN
      t.string :name
      t.string :author
      t.string :publisher
      t.references :owner, foreign_key: true

      t.timestamps
    end
    add_index :books, [:owner_id, :created_at]
  end
end
