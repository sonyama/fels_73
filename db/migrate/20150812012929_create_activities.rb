class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :user, index: true, foreign_key: true
      t.references :lession, index: true, foreign_key: true
      t.integer :number_of_word

      t.timestamps null: false
    end
    add_index :activities, [:user_id, :created_at]
  end
end
