class WorkoutSetsController < ApplicationController
  before_action :find_set, only: [:show, :edit, :update, :destroy]
  before_action :find_workout

  def index
    @sets = @workout.workout_sets
  end

  def show
  end

  def new
    @set = @workout.workout_sets.build
  end

  def edit
  end

  def create
    @set = @workout.workout_sets.build(set_params)
    if @set.save
      redirect_to workout_workout_sets_path(@workout)
    else
      render 'new'
    end
  end

  def update
    if @set.update(set_params)
      redirect_to workout_workout_sets_path(@workout)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def find_set
    @set = WorkoutSet.find(params[:id])
  end

  private

  def set_params
    params.require(:workout_set).permit(:excercise_id, :weight, :reps)
  end

  private

  def find_workout
    @workout = Workout.find(params[:workout_id])
  end
end
