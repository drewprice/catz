class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.from_giphy
  end

  def create
    @cat = Cat.new(cat_params)
    redirect_to root_path if @cat.save
  end

  def moar
  end

  private

  def cat_params
    params.require(:cat).permit(:giphy_id)
  end
end
