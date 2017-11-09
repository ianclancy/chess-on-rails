class MiniGameSerializer < ActiveModel::Serializer
  attributes :id, :start_date

  has_many :pieces, serializer: MiniPieceSerializer

  def start_date
    object.updated_at.strftime("%B %-d, %Y")
  end
end
