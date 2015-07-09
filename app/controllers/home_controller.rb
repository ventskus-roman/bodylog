class HomeController < ApplicationController
  def index
    @workouts = current_user.workouts.order("date ASC, created_at ASC")
    @max_results = WorkoutSet.joins(:workout).where("user_id", current_user.id).group("excercise_id").having("weight = MAX(weight)")
  end
end
