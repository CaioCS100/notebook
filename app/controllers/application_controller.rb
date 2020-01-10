class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :verifiy_header

  def verifiy_header
    return if request.headers['Accept'] == 'application/vnd.api+json'

    render json: {message: 'Você precisa enviar no Header uma chave com Accept e com valor application/vnd.api+json'}, status: 406
  end
end
