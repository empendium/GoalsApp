class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    
    if @user.save
      flash[:notice] = "Thanks for signing up!"
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash[:notice] = "No way!"
      render :new
    end
  end
  
  def show
    @user = User.find(session[:user_id])
  end
end
