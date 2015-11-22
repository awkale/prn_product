class CreateMediaPoints < ActiveRecord::Migration
  def change
    create_table :media_points do |t|
      t.string :name
      t.string :category
      t.string :sub_category
      t.string :city
      t.string :country
      t.string :industry

      t.timestamps null: false
    end
  end
end
