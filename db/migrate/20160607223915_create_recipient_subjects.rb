class CreateRecipientSubjects < ActiveRecord::Migration
  def change
    create_table :recipient_subjects do |t|
      t.integer :subject_id
      t.integer :recipient_id
      t.references :recipient, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
