class CreateMorties < ActiveRecord::Migration[6.0]
  def change
    create_table :morties do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.string :state
      t.string :rarity
      t.string :photo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
