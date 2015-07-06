class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = current_user.workouts.order("date DESC, created_at DESC")
  end

  def show
  end

  def edit
  end

  def update
    if @workout.update(workout_params)
      redirect_to workouts_path
    else
      render 'edit'
    end
  end

  def destroy
    @workout.destroy
    redirect_to workouts_path
  end

  def new
    @workout = current_user.workouts.build
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      redirect_to workout_workout_sets_path(@workout)
    else
      render 'new'
    end
  end

  def statistic
    @workout = Workout.find(params[:workout_id])
    @sets = @workout.workout_sets
    @total_reps = calc_total_reps(@sets)
    @total_weight = calc_total_weith(@sets, @total_reps)
  end

  private

  def calc_total_reps(sets)
    total_reps = 0
    sets.each do |set|
      if set.reps
        total_reps += set.reps
      end
    end
    return total_reps
  end

  private

  def calc_total_weith(sets, total_reps)
    total_weight = 0
    sets.each do |set|
      if set.weight
        total_weight += set.weight
      end
    end
    return total_weight * total_reps
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
