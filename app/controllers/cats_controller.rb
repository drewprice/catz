class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.from_giphy
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to root_path
    else
      render :new
    end
  end

  def moar
  end

  private

  def cat_params
    params.require(:cat).permit(:giphy_id)
  end
end
