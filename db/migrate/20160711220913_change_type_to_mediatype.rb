class ChangeTypeToMediatype < ActiveRecord::Migration
  def change
    rename_column :multimedia, :type, :media_type
  end
end
