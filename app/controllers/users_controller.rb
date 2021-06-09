class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def new
    @user = User.new 
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])

    if @user.update(user_params)
      redirect_to '/dashboard'
    else
      render :edit
    end
  end



  def create
    @user = User.create(user_params)
    puts "came user"
    if @user.save
      puts "came save"
      session[:user_id] = @user.id
      redirect_to '/dashboard'
    else
      puts "came else"
      render :new
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:username, :password, :name, :email)
    end

end
