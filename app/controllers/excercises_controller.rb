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
      redirect_to edit_excercise_path(@excercise)
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
      redirect_to excercise_path(@excercise)
    else
      render 'edit'
    end
  end

  def destroy
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
