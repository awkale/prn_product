class AddAudienceSizeToMediaPoints < ActiveRecord::Migration
  def change
    add_column :media_points, :audience_size, :integer
  end
end
