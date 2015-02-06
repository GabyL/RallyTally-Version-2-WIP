class UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome aboard, #{@user.name}!"
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end


  protected

  def user_params
    params.require(:user).permit(:name, :email, :phone, :password)
    
  end
end
