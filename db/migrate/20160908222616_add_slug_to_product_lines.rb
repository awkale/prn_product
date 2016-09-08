class AddSlugToProductLines < ActiveRecord::Migration
  def change
    add_column :product_lines, :slug, :string
    add_index :product_lines, :slug, unique: true
  end
end
