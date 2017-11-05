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
      if move.castle?
        rook = move.castle_rook
        rook_old_column = rook.column
        if move.castle_type == "kingside"
          rook.update(column: 6)
        elsif move.castle_type == "queenside"
          rook.update(column: 4)
        end
      end

      if move.capture?
        captured_piece = move.to_occupant
        captured_piece_old_row = captured_piece.row
        captured_piece_old_column = captured_piece.column
        captured_piece.update(row: nil, column: nil)
      end

      if move.pawn_promotion?
        old_piece_type = "Pawn"
        piece.update(type: "Queen")
      end

      piece_old_row = piece.row
      piece_old_column = piece.column
      piece.update(row: move.to_row, column: move.to_column)

      if game.check
        if rook
          rook.update(column: rook_old_column)
        end
        if captured_piece
          captured_piece.update(row: captured_piece_old_row, column: captured_piece_old_column)
        end
        if old_piece_type
          piece.update(type: old_piece_type)
        end
        piece.update(row: piece_old_row, column: piece_old_column)
      else
        piece.update(moved: true)
        if rook
          rook.update(moved: true)
        end
        game.update(turn: game.switch_turn)
        move.save
      end
    end
  end
end
