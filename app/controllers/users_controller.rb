class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params) 
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully added.' }
        format.json { render :index, status: :created, location: @user }
      else
        format.html { render :index }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
  end

  def edit
  end

  def delete
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
