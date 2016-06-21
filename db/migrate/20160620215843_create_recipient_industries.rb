class CreateRecipientIndustries < ActiveRecord::Migration
  def change
    create_table :recipient_industries do |t|
      t.integer :recipient_id
      t.integer :industry_id
      t.references :recipient, index: true, foreign_key: true
      t.references :industry, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
