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
