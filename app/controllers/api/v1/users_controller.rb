class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id]), serializer: UserShowSerializer
  end

  def create
    user = User.new(user_params)
    user.password = JSON.parse(request.body.read)["password"]
    user.password_confirmation = JSON.parse(request.body.read)["password_confirmation"]
    if user.valid?
      user.save
    else
      @error_messages = user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
