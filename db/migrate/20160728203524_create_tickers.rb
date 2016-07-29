class CreateTickers < ActiveRecord::Migration
  def change
    create_table :tickers do |t|
      t.string :ticker_type

      t.timestamps null: false
    end
  end
end
