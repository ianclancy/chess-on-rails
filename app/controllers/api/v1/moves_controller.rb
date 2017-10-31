class Api::V1::MovesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Move.all
  end

  def create
    body = request.body.read
    parsed_body = JSON.parse(body)
    move = Move.new(parsed_body)
    piece = move.piece
    game = move.game

    if move.legal? && piece.legal_move?(move)
      move.save

      if move.capture?
        captured_piece = move.to_occupant
        captured_piece.row = nil
        captured_piece.column = nil
        captured_piece.save
      end

      if move.pawn_promotion?
        piece.type = "Queen"
        piece.save
      end

      piece.row = move.to_row
      piece.column = move.to_column
      piece.moved = true
      piece.save

      game.turn = game.switch_turn
      game.save
    end
  end
end
