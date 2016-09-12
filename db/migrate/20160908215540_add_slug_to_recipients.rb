class AddSlugToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :slug, :string
    add_index :recipients, :slug, unique: true
  end
end
