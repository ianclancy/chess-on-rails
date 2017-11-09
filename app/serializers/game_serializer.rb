class GameSerializer < ActiveModel::Serializer
  attributes :id, :turn, :start_date, :pieces

  belongs_to :user
  has_many :moves
  has_many :pieces

  def start_date
    object.updated_at.strftime("%B %-d, %Y")
  end
end
