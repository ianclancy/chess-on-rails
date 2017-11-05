class PieceSerializer < ActiveModel::Serializer
  attributes :id, :side, :row, :column, :moved, :type, :symbol
end
