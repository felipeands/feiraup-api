class HomeController < ApplicationController
  def index
  end
  def teste
    render json: { 'key': 'primeiro retorno' }
  end
end
