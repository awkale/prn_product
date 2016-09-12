class AddSlugToTickers < ActiveRecord::Migration
  def change
    add_column :tickers, :slug, :string
    add_index :tickers, :slug, unique: true
  end
end
