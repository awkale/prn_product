class RemoveCategoryFromRecipients < ActiveRecord::Migration
  def change
    remove_column :recipients, :category, :string
  end
end
