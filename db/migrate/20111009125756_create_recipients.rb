class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :firstname
      t.string :lastname
      t.integer :user_id

      t.timestamps
    end
  end
end
