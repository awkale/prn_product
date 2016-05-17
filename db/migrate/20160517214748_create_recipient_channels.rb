class CreateRecipientChannels < ActiveRecord::Migration
  def change
    create_table :recipient_channels do |t|
      t.references :channel, index: true, foreign_key: true
      t.references :recipient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
