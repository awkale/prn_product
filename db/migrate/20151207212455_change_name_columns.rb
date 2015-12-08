class ChangeNameColumns < ActiveRecord::Migration
  def change
    rename_column :products, :name, :product_name
    rename_column :media_points, :name, :media_point_name
  end
end
