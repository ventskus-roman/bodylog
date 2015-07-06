class AddDurationToWorkoutSet < ActiveRecord::Migration
  def change
    add_column :workout_sets, :duration, :integer
  end
end
