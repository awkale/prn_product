class ChangeDescriptionTypeToText < ActiveRecord::Migration
  def change
    change_column :media_points, :description, :text
  end
end
