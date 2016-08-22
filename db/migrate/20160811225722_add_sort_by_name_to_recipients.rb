class AddSortByNameToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :sort_by_name, :string
  end
end
