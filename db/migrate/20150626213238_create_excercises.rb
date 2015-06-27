class CreateExcercises < ActiveRecord::Migration
  def change
    create_table :excercises do |t|
      t.string :name
      t.references :category, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
