class Bishop < Piece
  def legal_move?(move)
    if move.direction == "positive diagonal" || move.direction == "negative diagonal"
      return true
    else
      return false
    end
  end

  def symbol
    if side == "white"
      return "\u2657".encode("utf-8")
    else
      return "\u265D".encode("utf-8")
    end
  end
end
