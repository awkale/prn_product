class CreateRenderings < ActiveRecord::Migration
  def change
    create_table :renderings do |t|
      t.integer :recipient_id
      t.integer :multimedium_id
      t.references :multimedium, index: true, foreign_key: true
      t.references :recipient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
