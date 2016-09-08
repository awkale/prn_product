class AddSlugToMultimedia < ActiveRecord::Migration
  def change
    add_column :multimedia, :slug, :string
    add_index :multimedia, :slug, unique: true
  end
end
