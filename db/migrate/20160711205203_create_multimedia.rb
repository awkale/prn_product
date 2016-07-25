class CreateMultimedia < ActiveRecord::Migration
  def change
    create_table :multimedia do |t|
      t.string :type
      t.string :icon

      t.timestamps null: false
    end
  end
end
