class Piece < ApplicationRecord
  belongs_to :game

  def can_move_to(row, column)
    # move = Move.new(game_id: game.id, piece_id: id, to_row: row, to_column: column)
    # if move.legal? && legal_move?(move)
    #   return true
    # else
    #   return false
    # end
  end

  def possible_moves
    # moves = []
    # if row
    #   to_row = 1
    #   while to_row <= 8
    #     to_column = 1
    #     while to_column <= 8
    #       move = Move.new(game_id: game.id, piece_id: id, to_row: to_row, to_column: to_column)
    #       if move.legal? && legal_move?(move)
    #         moves << move
    #       end
    #       to_column += 1
    #     end
    #     to_row += 1
    #   end
    #   moves
    # end
    # moves
  end
end
