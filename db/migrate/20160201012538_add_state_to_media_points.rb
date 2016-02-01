class AddStateToMediaPoints < ActiveRecord::Migration
  def change
    add_column :media_points, :state, :string
  end
end
