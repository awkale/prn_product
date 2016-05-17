class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :recipient_name
      t.string :alternate_name
      t.string :category
      t.text :description
      t.string :city
      t.string :state
      t.string :country

      t.timestamps null: false
    end
  end
end
