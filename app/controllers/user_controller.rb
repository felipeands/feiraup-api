class UserController < ApplicationController

  def login
    user_params = login_params()

    user = User.login(user_params)

    if user.present?
      render json: {access_token: user.access_token}, status: :ok
    end

    puts "#{user_params.inspect}".on_blue
    render json: {key: 'teste'}
  end

  private

  def login_params
    params.permit(:username,:password)
  end

end