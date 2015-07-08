class HomeController < ApplicationController
  def index
    @workouts = current_user.workouts.order("date ASC, created_at ASC")
  end
end
