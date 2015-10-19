class SessionsController < ApplicationController
  def create
    user = User.from_oauth(env['omniauth.auth'])
    session[:user_id] = user.id

    redirect_to root_path, notice: "Hay. Welcom 2 teh kats."
  end
end
