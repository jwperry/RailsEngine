class CreateItems < ActiveRecord::Migration
  def change
    enable_extension("citext")
    create_table :items do |t|
      t.citext :name
      t.citext :description
      t.decimal :unit_price, precision: 12, scale: 2
      t.references :merchant, index: true, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
