class Api::V1::PiecesController < ApplicationController
  def index
    render json: Piece.all
  end
end
