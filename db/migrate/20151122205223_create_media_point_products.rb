class CreateMediaPointProducts < ActiveRecord::Migration
  def change
    create_table :media_point_products do |t|
      t.references :media_point, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
