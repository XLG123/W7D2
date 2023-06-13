SessionsController < ApplicationController
  before_action :require_logged_in, only: [:destroy]
  before_action :require_logged_out, only: [:new, :create]

  def new
    render :new
  end

  def create
    username = params[:user][:email]
    password = params[:user][:password]

    if @user
      login(@user)
      redirect_to user_url(@user.id)
    else
      flash.now[:errors] = ['Invalid Credentials']
      render :new
    end
  end

  
end