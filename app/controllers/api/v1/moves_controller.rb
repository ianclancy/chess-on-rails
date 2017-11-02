class Api::V1::MovesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Move.all
  end

  def create
    move = Move.new(JSON.parse(request.body.read))
    piece = move.piece
    game = move.game

    if move.legal? && piece.legal_move?(move)
      move.save

      if move.castle?
        rook = move.castle_rook
        if move.castle_type == "kingside"
          rook.column = 6
        elsif move.castle_type == "queenside"
          rook.column = 4
        end
        rook.save
      end

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
