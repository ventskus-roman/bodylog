class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :title
      t.datetime :date

      t.timestamps null: false
    end
  end
end
