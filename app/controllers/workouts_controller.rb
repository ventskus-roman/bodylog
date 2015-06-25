class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = current_user.workouts
  end

  def show
  end

  def edit
  end

  def update
    if @workout.update(workout_params)
      redirect_to edit_workout_path(@workout)
    else
      render 'edit'
    end
  end

  def destroy
  end

  def new
    @workout = current_user.workouts.build
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      redirect_to edit_workout_path(@workout)
    else
      render 'new'
    end
  end

  private
  
  def find_workout
    @workout = Workout.find(params[:id])
  end

  private

  def workout_params
    params.require(:workout).permit(:title, :date)
  end
end