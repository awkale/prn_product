class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :recipients, :category_id
    add_index :recipients, :ticker_id
  end
end