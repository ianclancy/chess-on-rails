class MiniPieceSerializer < ActiveModel::Serializer
  attributes :id, :row, :column, :symbol
end
