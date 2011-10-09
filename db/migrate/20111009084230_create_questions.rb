class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :description
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
      t.string :image_uri

      t.timestamps
    end
  end
end
