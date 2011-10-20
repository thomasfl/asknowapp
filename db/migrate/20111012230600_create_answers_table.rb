class CreateAnswersTable < ActiveRecord::Migration
  def self.up
    create_table :answers, :id => false do |t|
      t.string :guid, :null => false
      t.string :recipient_email, :null => false
      t.references :user, :null => true
      t.integer :question_owner_id, :null => false
      t.boolean :is_pending
      t.string :answer
      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
