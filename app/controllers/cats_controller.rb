class CatsController < ApplicationController
  before_action :find_or_initialize, only: :create

  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.from_giphy
  end

  def create
    if @cat.save
      redirect_to root_path
    else
      render :new
    end
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
