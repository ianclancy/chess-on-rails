class Pawn < Piece
  def legal_move?(move)
    if move.distance > 0 && side == "white" || move.distance < 0 && side == "black"
      if move.capture?
        if ["positive diagonal", "negative diagonal"].include?(move.direction) && move.distance.abs == 1
          return true
        end
      else
        if move.direction == "vertical" && (!moved && move.distance.abs == 2 || move.distance.abs == 1)
          return true
        end
      end
    end
    return false
  end

  def symbol
    if side == "white"
      return "\u2659".encode('utf-8')
    else
      return "\u265F".encode('utf-8')
    end
  end
end
