class DropMediaPointChannels < ActiveRecord::Migration
  def change
    drop_table :media_point_channels
  end
end
