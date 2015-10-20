class CatsController < ApplicationController
  before_action :find_or_initialize, only: :create
  before_filter :authenticate_user!, only: [:create, :index]

  def index
    @cats = current_user.cats
  end

  def new
    @cat = Cat.from_giphy
  end

  def create
    current_user.cats << @cat

    if @cat.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @cat = Cat.from_giphy(params[:giphy_id])
  rescue
    redirect_to '/404'
  end

  private

  def find_or_initialize
    @cat = Cat.find_by(cat_params)
    @cat = Cat.new(cat_params) unless @cat
  end

  def cat_params
    params.require(:cat).permit(:giphy_id)
  end
end
