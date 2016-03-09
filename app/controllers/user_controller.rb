class UserController < ApplicationController

  def login
    puts "acessou".on_blue
    render json: {key: 'teste'}
  end

end