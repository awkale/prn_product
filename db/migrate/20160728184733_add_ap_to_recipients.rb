class AddApToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :ap, :boolean
  end
end
