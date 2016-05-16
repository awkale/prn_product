class ChangeCategoryToDescription < ActiveRecord::Migration
  def change
    rename_column :media_points, :sub_category, :description
  end
end
