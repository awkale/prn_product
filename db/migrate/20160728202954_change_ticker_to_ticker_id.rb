class ChangeTickerToTickerId < ActiveRecord::Migration
  def change
    rename_column :recipients, :ticker, :ticker_id
  end
end
