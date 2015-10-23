class CatsController < ApplicationController
  before_action :reset_focus, only: :index
  before_action :set_cat, only: :destroy
  before_action :find_or_initialize, only: :create
  before_filter :authenticate_user!, only: [:create, :index]

  def index
    @cats = current_user.cats
  end

  def new
    @cat = Cat.from_giphy(tag: current_focus)
  rescue
    reset_focus
    @cat = Cat.from_giphy
  end

  def create
    current_user.cats << @cat
    @cat.save
  end

  def show
    @cat = Cat.from_giphy(giphy_id: query_param)
  rescue
    easter_egg
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
    @cat = Cat.from_giphy(giphy_id: params[:giphy_id]) unless @cat
  end

  def cat_params
    params.require(:cat).permit(:giphy_id)
  end

  def query_param
    params[:giphy_id]
  end

  def easter_egg
    flash.now[:notice] = "U can has #{query_param}!"
    set_focus(query_param)
    @cat = Cat.from_giphy_translate(query_param)
  rescue
    no_easter_egg
  end

  def no_easter_egg
    reset_focus
    flash.now[:notice] = "U cant has #{query_param}."
    @cat = Cat.from_giphy_translate('not found!')
  end
end
