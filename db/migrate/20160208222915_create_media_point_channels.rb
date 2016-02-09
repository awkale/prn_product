class CreateMediaPointChannels < ActiveRecord::Migration
  def change
    create_table :media_point_channels do |t|
      t.references :media_point, index: true, foreign_key: true
      t.references :channel, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
