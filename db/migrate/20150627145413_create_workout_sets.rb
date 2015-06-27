class CreateWorkoutSets < ActiveRecord::Migration
  def change
    create_table :workout_sets do |t|
      t.float :weight
      t.integer :reps
      t.references :excercise, index: true, foreign_key: true
      t.references :workout, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
