class Api::V1::CurrentController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: current_user
  end
end
