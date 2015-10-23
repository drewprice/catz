class SessionsController < ApplicationController
  def create
    user = User.from_oauth(ENV['omniauth.auth'])
    session[:user_id] = user.id

    if session[:tmp_cat_params]
      set_cat
      redirect_to_create_cat
    else
      redirect_to root_path, notice: "Hay. Welcom 2 teh kats."
    end
  end

  def destroy
    session[:user_id] = nil
    session[:focus] = nil
    redirect_to root_path, notice: "K Bai."
  end

  private

  def redirect_to_create_cat
    current_user.cats << @cat

    if @cat.save
      redirect_to cat_path(@cat.giphy_id), notice: "Hay. Welcom 2 teh kats."
    else
      redirect_to cat_path(@cat.giphy_id), alert: "Didn't save it."
    end
  end

  def set_cat
    @cat = Cat.find_by(session[:tmp_cat_params])
    @cat = Cat.new(session[:tmp_cat_params]) unless @cat
    session[:tmp_cat_params] = nil
  end
end
