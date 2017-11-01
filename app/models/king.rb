class King < Piece
  def legal_move?(move)
    if move.castle? && move.distance.abs == 2 || move.distance.abs == 1
      return true
    else
      return false
    end
  end

  def symbol
    if side == "white"
      return "\u2654".encode('utf-8')
    else
      return "\u265A".encode('utf-8')
    end
  end
end
