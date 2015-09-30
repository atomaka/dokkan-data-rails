class SessionsController < ApplicationController
  def create
    user = User.create_with_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id

    require 'pp'
    pp env['omniauth.auth']

    redirect_to root_path, notice: 'You are now logged in'
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path, notice: 'You have been logged out'
  end

  def failure
    redirect_to root_path, notice: 'Failed to login'
  end
end
