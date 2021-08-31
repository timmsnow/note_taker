class UsersController < ApplicationController

  # def index
  #   users = User.all
  #   render json: users
  # end
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    session[:user_id] = @user.id
    if @user.save
      redirect_to users_url
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  private

    def user_params
      params.permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
