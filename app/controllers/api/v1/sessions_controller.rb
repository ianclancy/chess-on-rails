class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      render json: user
    else
      render json: { error: "Invalid email and password combination." }
    end
  end

  def destroy
    sign_out
  end

  private

  def session_params
    params.require(:session).permit(
      :email,
      :password
    )
  end
end
