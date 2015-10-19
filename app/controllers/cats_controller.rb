class CatsController < ApplicationController
  def index
    @cats = Cat.giphy(5)
  end

  def moar
  end
end
