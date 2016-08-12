class Api::V1::BaseController < ApplicationController
  respond_to :json, :xml
  before_action :authenticate

  def authenticate
    authenticate_or_request_with_http_basic('Please authenticate to use API') do |username, password|
      user = User.find_by(username: username)
      return true if user && user.authenticate(password)
      head :unauthorize
    end
  end
end
