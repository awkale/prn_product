class DropMediaPointProduct < ActiveRecord::Migration
  def change
    drop_table :media_point_products
  end
end
