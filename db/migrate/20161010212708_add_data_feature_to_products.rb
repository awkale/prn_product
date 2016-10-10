class AddDataFeatureToProducts < ActiveRecord::Migration
  def change
    add_column :products, :data_feature, :string
  end
end
