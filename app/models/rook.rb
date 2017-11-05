class Rook < Piece
  def legal_move?(move)
    if move.direction == "horizontal" || move.direction == "vertical"
      return true
    else
      return false
    end
  end

  def symbol
    if side == "white"
      return "\u2656".encode("utf-8")
    else
      return "\u265C".encode("utf-8")
    end
  end
end
