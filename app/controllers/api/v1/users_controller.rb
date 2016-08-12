class Api::V1::UsersController < Api::V1::BaseController

  def show
    respond_with Tool.all
  end
end
