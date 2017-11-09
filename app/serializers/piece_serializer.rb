class PieceSerializer < ActiveModel::Serializer
  attributes :id, :side, :row, :column, :moved, :type, :symbol

  belongs_to :game
end
