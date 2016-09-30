class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  def new
  end

  def create
    if login(params[:email], params[:password], params[:remember_me])
      flash[:success] = 'Снова к нам? ;)'  
      redirect_back_or_to root_path
    else
      flash.now[:warning] = 'Неверный E-mail и/или пароль.'
      render 'new'
    end
  end

  def destroy
    logout
    flash[:success] = 'До встречи!'
    redirect_to log_in_path
  end
end