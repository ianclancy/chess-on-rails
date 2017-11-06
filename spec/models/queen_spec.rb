require 'rails_helper'

RSpec.describe Queen, type: :model do
  let(:user) { User.create(name: "John", email: "john@test.com", password: "password", password_confirmation: "password") }
  let(:white_game) { Game.create(turn: "white", user_id: user.id) }
  let(:black_game) { Game.create(turn: "black", user_id: user.id) }
  let(:white_queen) { Queen.create(game_id: white_game.id, side: "white", row: 1, column: 4, moved: false) }
  let(:black_queen) { Queen.create(game_id: black_game.id, side: "black", row: 8, column: 4, moved: false) }
  let(:move) { Move.new(game_id: white_game.id, piece_id: white_queen.id, to_row: 1, to_column: 3) }

  describe ".new" do
    it "takes a game_id, side, row, column and moved as arguments" do
      expect(white_queen).to be_a(Queen)
      expect(white_queen).to be_a(Piece)
    end
  end

  describe "#legal_move?" do
    it "should return true" do
      expect(white_queen.legal_move?(move)).to be(true)
    end
  end

  describe "#symbol" do
    it "should return the correct symbol" do
      expect(white_queen.symbol).to eq("\u2655".encode("utf-8"))
      expect(black_queen.symbol).to eq("\u265B".encode("utf-8"))
    end
  end
end
