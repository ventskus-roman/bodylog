class HomeController < ApplicationController
  def index
    @workouts = current_user.workouts.order("date DESC, created_at DESC")
    @max_results = WorkoutSet.joins(:workout).where("user_id", current_user.id).group("excercise_id").having("weight = MAX(weight)")
  end
end
