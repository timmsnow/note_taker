class SessionsController < ApplicationController
  
  # def create
  #   user = User.find_by(email: params[:email])
  #   if user && user.authenticate(params[:password])
  #     jwt = JWT.encode(
  #       {
  #         user_id: user.id, # the data to encode
  #         exp: 24.hours.from_now.to_i, # the expiration time
  #       },
  #       Rails.application.credentials.fetch(:secret_key_base), # the secret key
  #       "HS256" # the encryption algorithm
  #     )
  #     render json: { jwt: jwt, email: user.email, user_id: user.id }, status: :created
  #   else
  #     render json: {}, status: :unauthorized
  #   end
  # end

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        forwarding_url = session[:forwarding_url]
        reset_session
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        log_in user
        redirect_to forwarding_url || user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
