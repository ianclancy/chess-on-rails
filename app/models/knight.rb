class Knight < Piece
  def legal_move?(move)
    if move.vertical_change.abs == 2 && move.horizontal_change.abs == 1 || move.vertical_change.abs == 1 && move.horizontal_change.abs == 2
      return true
    else
      return false
    end
  end

  def symbol
    if side == "white"
      return "\u2658".encode('utf-8')
    else
      return "\u265E".encode('utf-8')
    end
  end
end
