class CreateIndustries < ActiveRecord::Migration
  def change
    create_table :industries do |t|
      t.string :industry_name
      t.integer :parent_id, :null => true, :index => true
      t.integer :lft, :null => false, :index => true
      t.integer :rgt, :null => false, :index => true
      t.integer :depth, :null => false, :default => 0
      t.integer :children_count, :null => false, :default => 0

      t.timestamps null: false
    end
  end
end
