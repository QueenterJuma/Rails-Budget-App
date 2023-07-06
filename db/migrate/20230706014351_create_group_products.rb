class CreateGroupProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :group_products do |t|
      t.references :groups, null: false, foreign_key: true
      t.references :products, null: false, foreign_key: true

      t.timestamps
    end
  end
end
