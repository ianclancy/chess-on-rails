require 'rails_helper'

RSpec.describe Rook, type: :model do
  let(:user) { User.create(name: "John", email: "john@test.com", password: "password", password_confirmation: "password") }
  let(:game) { Game.create(turn: "white", user_id: user.id) }
  let(:white_rook) { Rook.create(game_id: game.id, side: "white", row: 1, column: 1, moved: false) }
  let(:black_rook) { Rook.create(game_id: game.id, side: "black", row: 8, column: 1, moved: false) }
  let(:legal_move_1) { Move.new(game_id: game.id, piece_id: white_rook.id, to_row: 1, to_column: 5) }
  let(:legal_move_2) { Move.new(game_id: game.id, piece_id: white_rook.id, to_row: 7, to_column: 1) }
  let(:illegal_move_1) { Move.new(game_id: game.id, piece_id: white_rook.id, to_row: 3, to_column: 3) }
  let(:illegal_move_2) { Move.new(game_id: game.id, piece_id: black_rook.id, to_row: 6, to_column: 6) }
  let(:illegal_move_3) { Move.new(game_id: game.id, piece_id: white_rook.id, to_row: 2, to_column: 3) }

  describe ".new" do
    it "takes a game_id, side, row, column and moved as arguments" do
      expect(white_rook).to be_a(Rook)
      expect(white_rook).to be_a(Piece)
    end
  end

  describe "#legal_move?" do
    it "should return true for a legal move" do
      expect(white_rook.legal_move?(legal_move_1)).to be(true)
      expect(white_rook.legal_move?(legal_move_2)).to be(true)
    end

    it "should return false for an illegal move" do
      expect(white_rook.legal_move?(illegal_move_1)).to be(false)
      expect(black_rook.legal_move?(illegal_move_2)).to be(false)
      expect(white_rook.legal_move?(illegal_move_3)).to be(false)
    end
  end

  describe "#symbol" do
    it "should return the correct symbol" do
      expect(white_rook.symbol).to eq("\u2656".encode("utf-8"))
      expect(black_rook.symbol).to eq("\u265C".encode("utf-8"))
    end
  end
end
