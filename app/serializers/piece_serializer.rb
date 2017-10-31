class PieceSerializer < ActiveModel::Serializer
  attributes :id, :side, :row, :column, :moved, :type, :symbol

  def possible_moves
    object.possible_moves
  end
end
