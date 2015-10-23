class CatsController < ApplicationController
  before_action :set_cat, only: :destroy
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
    @cat.save
  end

  def show
    @cat = Cat.from_giphy(params[:giphy_id])
  rescue
    flash[:notice] = 'U can has easter egg.'
    @cat = Cat.from_giphy_translate(params[:giphy_id])
  end

  def destroy
    current_user.cats.delete(@cat)
  end

  private

  def set_cat
    @cat = Cat.find_by(giphy_id: params[:giphy_id])
  end

  def find_or_initialize
    @cat = Cat.find_by(giphy_id: params[:giphy_id])
    @cat = Cat.from_giphy(params[:giphy_id]) unless @cat
  end

  def cat_params
    params.require(:cat).permit(:giphy_id)
  end
end
