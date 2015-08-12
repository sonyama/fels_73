class CreateLessions < ActiveRecord::Migration
  def change
    create_table :lessions do |t|
      t.string :name
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
