class DropMediaPoint < ActiveRecord::Migration
  def change
    drop_table :media_points
  end
end
