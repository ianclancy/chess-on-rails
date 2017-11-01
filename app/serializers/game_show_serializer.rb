class GameShowSerializer < ActiveModel::Serializer
  attributes :id, :turn, :black_in_check, :white_in_check

  has_many :moves
  has_many :pieces
end
