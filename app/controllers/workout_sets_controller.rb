class WorkoutSetsController < ApplicationController
  before_action :find_set, only: [:show, :edit, :update, :destroy]
  before_action :find_workout
  before_action :find_workout_sets, only: [:index, :create]

  def index
    @last_set = @workout.workout_sets.order('created_at').last
    @has_sets = @workout.workout_sets.count > 0
    prepare_max_params(@sets)
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
    params.require(:workout_set).permit(:excercise_id, :weight, :reps, :hours, :minutes, :seconds)
  end

  private

  def find_workout
    @workout = Workout.find(params[:workout_id])
  end

  private

  def find_workout_sets
    @sets = @workout.workout_sets.order("excercise_id")
  end

  private

  def prepare_max_params(sets)
    sets.group('"excercise_id"').having('weight = MAX(weight)').each do |set|
      sets.each do |inner_set|
        if inner_set.id == set.id
          inner_set.has_max_weight = true
        end
      end
    end
    sets.group('"excercise_id"').having('reps = MAX(reps)').each do |set|
      sets.each do |inner_set|
        if inner_set.id == set.id
          inner_set.has_max_reps = true
        end
      end
    end
    sets.where("duration > 0").group('"excercise_id"').having('duration = MIN(duration)').each do |set|
      sets.each do |inner_set|
        if inner_set.id == set.id
          inner_set.has_min_time = true
        end
      end
    end
  end

end
