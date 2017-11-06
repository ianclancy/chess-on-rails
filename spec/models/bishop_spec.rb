require 'rails_helper'

RSpec.describe Bishop, type: :model do
  let(:user) { User.create(name: "John", email: "john@test.com", password: "password", password_confirmation: "password") }
  let(:game) { Game.create(turn: "white", user_id: user.id) }
  let(:white_bishop) { Bishop.create(game_id: game.id, side: "white", row: 1, column: 3, moved: false) }
  let(:black_bishop) { Bishop.create(game_id: game.id, side: "black", row: 8, column: 6, moved: false) }
  let(:legal_move_1) { Move.new(game_id: game.id, piece_id: white_bishop.id, to_row: 2, to_column: 2) }
  let(:legal_move_2) { Move.new(game_id: game.id, piece_id: white_bishop.id, to_row: 6, to_column: 8) }
  let(:illegal_move_1) { Move.new(game_id: game.id, piece_id: white_bishop.id, to_row: 1, to_column: 6) }
  let(:illegal_move_2) { Move.new(game_id: game.id, piece_id: white_bishop.id, to_row: 5, to_column: 3) }
  let(:illegal_move_3) { Move.new(game_id: game.id, piece_id: white_bishop.id, to_row: 3, to_column: 4) }

  describe ".new" do
    it "takes a game_id, side, row, column and moved as arguments" do
      expect(white_bishop).to be_a(Bishop)
      expect(white_bishop).to be_a(Piece)
    end
  end

  describe "#legal_move?" do
    it "should return true for a legal move" do
      expect(white_bishop.legal_move?(legal_move_1)).to be(true)
      expect(white_bishop.legal_move?(legal_move_2)).to be(true)
    end

    it "should return false for an illegal move" do
      expect(white_bishop.legal_move?(illegal_move_1)).to be(false)
      expect(white_bishop.legal_move?(illegal_move_2)).to be(false)
      expect(white_bishop.legal_move?(illegal_move_3)).to be(false)
    end
  end

  describe "#symbol" do
    it "should return the correct symbol" do
      expect(white_bishop.symbol).to eq("\u2657".encode("utf-8"))
      expect(black_bishop.symbol).to eq("\u265D".encode("utf-8"))
    end
  end
end
