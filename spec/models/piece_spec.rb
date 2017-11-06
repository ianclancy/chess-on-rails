require 'rails_helper'

RSpec.describe Piece, type: :model do
  let(:user) { User.create(name: "John", email: "john@test.com", password: "password", password_confirmation: "password") }
  let(:game) { Game.create(turn: "white", user_id: user.id) }
  let(:piece) { Queen.new(game_id: game.id, side: "white", row: 1, column: 4, moved: false) }

  describe ".new" do
    it "takes a game_id, type, side, row, column and moved as arguments" do
      expect(piece).to be_a(Piece)
      expect(piece.game_id).to eq(game.id)
      expect(piece.type).to eq("Queen")
      expect(piece.side).to eq("white")
      expect(piece.row).to eq(1)
      expect(piece.column).to eq(4)
      expect(piece.moved).to be(false)
    end
  end
end
