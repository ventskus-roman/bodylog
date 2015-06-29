class WorkoutSetsController < ApplicationController
  before_action :find_set, only: [:show, :edit, :update, :destroy]
  before_action :find_workout
  before_action :find_workout_sets, only: [:index, :create]

  def index
    @last_set = @workout.workout_sets.order('created_at').last
    @has_sets = @workout.workout_sets.count > 0
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
      render 'index'
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
    @set.destroy
    redirect_to workout_workout_sets_path(@workout)
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

  private

  def find_workout_sets
    @sets = @workout.workout_sets
  end
end
