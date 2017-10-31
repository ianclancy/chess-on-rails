class MoveSerializer < ActiveModel::Serializer
  attributes :id, :to_row, :to_column

  belongs_to :piece
end
