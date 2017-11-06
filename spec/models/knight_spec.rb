require 'rails_helper'

RSpec.describe Knight, type: :model do
  let(:user) { User.create(name: "John", email: "john@test.com", password: "password", password_confirmation: "password") }
  let(:white_game) { Game.create(turn: "white", user_id: user.id) }
  let(:black_game) { Game.create(turn: "black", user_id: user.id) }
  let(:white_knight) { Knight.create(game_id: white_game.id, side: "white", row: 1, column: 2, moved: false) }
  let(:black_knight) { Knight.create(game_id: black_game.id, side: "black", row: 8, column: 7, moved: false) }
  let(:legal_move_1) { Move.new(game_id: white_game.id, piece_id: white_knight.id, to_row: 3, to_column: 1) }
  let(:legal_move_2) { Move.new(game_id: white_game.id, piece_id: white_knight.id, to_row: 3, to_column: 3) }
  let(:legal_move_3) { Move.new(game_id: black_game.id, piece_id: black_knight.id, to_row: 7, to_column: 5) }
  let(:illegal_move_1) { Move.new(game_id: white_game.id, piece_id: white_knight.id, to_row: 3, to_column: 2) }
  let(:illegal_move_2) { Move.new(game_id: black_game.id, piece_id: black_knight.id, to_row: 5, to_column: 4) }

  describe ".new" do
    it "takes a game_id, side, row, column and moved as arguments" do
      expect(white_knight).to be_a(Knight)
      expect(white_knight).to be_a(Piece)
    end
  end

  describe "#legal_move?" do
    it "should return true for a legal move" do
      expect(white_knight.legal_move?(legal_move_1)).to be(true)
      expect(white_knight.legal_move?(legal_move_2)).to be(true)
      expect(black_knight.legal_move?(legal_move_3)).to be(true)
    end

    it "should return false for an illegal move" do
      expect(white_knight.legal_move?(illegal_move_1)).to be(false)
      expect(white_knight.legal_move?(illegal_move_2)).to be(false)
    end
  end

  describe "#symbol" do
    it "should return the correct symbol" do
      expect(white_knight.symbol).to eq("\u2658".encode("utf-8"))
      expect(black_knight.symbol).to eq("\u265E".encode("utf-8"))
    end
  end
end
