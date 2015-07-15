class HomeController < ApplicationController
  def index
    if (current_user)
      @workouts = current_user.workouts.order("date DESC, created_at DESC")
      @max_results = WorkoutSet.joins(:workout).group("excercise_id").where("user_id = ?", current_user.id).having("weight = MAX(weight)")
    end
  end
end
