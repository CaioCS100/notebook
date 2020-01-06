class ApplicationController < ActionController::API
  before_action :verifiy_header

  def verifiy_header
    return if request.headers['Accept'] == 'application/vnd.api+json'

    render nothing: true, status: 406
  end
end
