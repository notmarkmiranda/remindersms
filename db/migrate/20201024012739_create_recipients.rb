class CreateRecipients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipients do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.references :user, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
