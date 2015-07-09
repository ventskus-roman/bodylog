class ExcercisesController < ApplicationController
  before_action :find_excercise, only: [:show, :edit, :update, :destroy]

  def index
    @excercises = Excercise.all
  end

  def show
  end

  def create
    @excercise = Excercise.new(excercise_params)
    if @excercise.save
      redirect_to excercises_path
    else
      render 'new'
    end
  end

  def new
    @excercise = Excercise.new
  end

  def edit
  end

  def update
    if @excercise.update(excercise_params)
      redirect_to excercises_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  def statistic
    @excercise = Excercise.find(params[:excercise_id])
    @sets = @excercise.workout_sets.joins(:workout).where("user_id", current_user.id).order("date DESC, created_at ASC")
    max_weights_sets = @excercise.workout_sets.joins(:workout).group(:date).having('weight = MAX(weight)')
    @max_weights = max_weights_sets.all.reduce({}) {|hsh,set| hsh[set.workout.date] = set.weight; hsh }
    @volume = @sets.all.reduce({}) { |hsh,set|
      set.weight = set.weight ? set.weight : 1
      set.reps = set.reps ? set.reps : 1
      set_volume = set.weight * set.reps
      hsh[set.workout.date] = hsh[set.workout.date] ? hsh[set.workout.date] + set_volume : set_volume
      hsh
    }
    @volume_on_max_weight = max_weights_sets.all.reduce({}) { |hsh,set|
      set.weight = set.weight ? set.weight : 1
      set.reps = set.reps ? set.reps : 1
      set_volume = set.weight * set.reps
      hsh[set.workout.date] = hsh[set.workout.date] ? hsh[set.workout.date] + set_volume : set_volume
      hsh
    }

  end

  private

  def find_excercise
    @excercise = Excercise.find(params[:id])
  end

  private

  def excercise_params
    params.require(:excercise).permit(:name, :description, :category_id)
  end
end
