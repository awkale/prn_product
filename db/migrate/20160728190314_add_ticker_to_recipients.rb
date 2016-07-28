class AddTickerToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :ticker, :integer
  end
end
