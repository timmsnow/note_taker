class ApplicationController < ActionController::Base
  # protect_from_forgery prepend: true
  # def current_user
  #   auth_headers = request.headers["Authorization"]
  #   if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
  #     token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
  #     begin
  #       decoded_token = JWT.decode(
  #         token,
  #         Rails.application.credentials.fetch(:secret_key_base),
  #         true,
  #         { algorithm: "HS256" }
  #       )
  #       User.find_by(id: decoded_token[0]["user_id"])
  #     rescue JWT::ExpiredSignature
  #       nil
  #     end
  #   end
  # end

  # def authenticate_user
  #   unless current_user
  #     render json: {}, status: :unauthorized
  #   end
  # end

  # def authenticate_admin
  #   unless current_user && current_user.admin
  #     render json: {}, status: :unauthorized
  #   end
  # end

  include SessionsHelper

  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
