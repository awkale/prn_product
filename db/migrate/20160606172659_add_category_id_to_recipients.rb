class AddCategoryIdToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :category_id, :integer
  end
end
