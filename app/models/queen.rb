class Queen < Piece
  def legal_move?(move)
    true
  end

  def symbol
    if side == "white"
      return "\u2655".encode("utf-8")
    else
      return "\u265B".encode("utf-8")
    end
  end
end
