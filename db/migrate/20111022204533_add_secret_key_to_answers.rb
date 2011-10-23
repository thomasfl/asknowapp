class AddSecretKeyToAnswers < ActiveRecord::Migration

  def change
    change_table :answers do |t|
      t.string :secret_key
      t.integer :value
      t.index :secret_key
      t.index :question_id
    end
  end

end
