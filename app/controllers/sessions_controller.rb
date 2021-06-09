class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create, :new, :welcome]
  def new
  end

  def create
    puts "came create"
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      puts "cameee dsfsffff"
       session[:user_id] = @user.id
       redirect_to '/dashboard'
    else
      puts "came logggggggg"
      @errors = "Username or password is incorrect, please try again"
       render :new
    end 
  end

  def login
  end

  def welcome
  end

  def logout
    session[:user_id] = nil
    redirect_to '/welcome'
  end
end
