class Api::ApiController < ApplicationController
  def render_object_errors
    render json: User.all
  end
end
