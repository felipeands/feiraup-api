class UserController < ApplicationController

  def login
    user_params = login_params()

    user = User.login(user_params[:username],user_params[:password])

    if user.present?
      render json: {access_token: user.access_token, email: user.email, role: user.role, name: user.name}, status: :ok
    else
      render json: {error: 'Verifique os dados e tente novamente.'}, status: :unauthorized
    end

  end

  private

  def login_params
    params.permit(:username,:password)
  end

end