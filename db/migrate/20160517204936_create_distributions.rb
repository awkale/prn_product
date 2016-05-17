class CreateDistributions < ActiveRecord::Migration
  def change
    create_table :distributions do |t|
      t.references :product, index: true, foreign_key: true
      t.references :recipient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
