class Api::V1::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate!
  token = 0


  def authenticate!
    auth_header = request.headers['Authorization']
    # token = auth_header.split(' ').last
    token = auth_header
    return true if JsonWebToken.decode(token)
  rescue
    render json: {error: "Error en la autenticación, Token Errado",token: token }
  end

  def invalid_authentication
    render json: {error: t('devise.failure.unathenthication')}, status: unathorized
  end
end
