class AddProductLineIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_line_id, :integer
  end
end
