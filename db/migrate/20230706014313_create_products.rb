class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :amount
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
