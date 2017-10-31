class GameShowSerializer < ActiveModel::Serializer
  attributes :id, :turn

  has_many :moves
  has_many :pieces
end
