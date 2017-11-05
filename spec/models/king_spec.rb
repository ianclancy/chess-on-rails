require 'rails_helper'

RSpec.describe King, type: :model do
  let(:game) { Game.create(turn: "white") }
  let(:white_king) { King.create(game_id: game.id, side: "white", row: 1, column: 5, moved: false) }
  let(:black_king) { King.create(game_id: game.id, side: "black", row: 8, column: 5, moved: false) }
  let(:legal_move_1) { Move.new(game_id: game.id, piece_id: white_king.id, to_row: 2, to_column: 4) }
  let(:legal_move_2) { Move.new(game_id: game.id, piece_id: white_king.id, to_row: 2, to_column: 5) }
  let(:legal_move_3) { Move.new(game_id: game.id, piece_id: white_king.id, to_row: 1, to_column: 7) }
  let(:illegal_move_1) { Move.new(game_id: game.id, piece_id: white_king.id, to_row: 1, to_column: 1) }
  let(:illegal_move_2) { Move.new(game_id: game.id, piece_id: white_king.id, to_row: 3, to_column: 3) }
  let(:illegal_move_3) { Move.new(game_id: game.id, piece_id: white_king.id, to_row: 3, to_column: 6) }

  describe ".new" do
    it "takes a game_id, side, row, column and moved as arguments" do
      expect(white_king).to be_a(King)
      expect(white_king).to be_a(Piece)
    end
  end

  describe "#legal_move?" do
    it "should return true for a legal move" do
      expect(white_king.legal_move?(legal_move_1)).to be(true)
      expect(white_king.legal_move?(legal_move_2)).to be(true)
    end

    it "should return false for an illegal move" do
      expect(white_king.legal_move?(illegal_move_1)).to be(false)
      expect(white_king.legal_move?(illegal_move_2)).to be(false)
      expect(black_king.legal_move?(illegal_move_3)).to be(false)
    end
  end

  describe "#symbol" do
    it "should return the correct symbol" do
      expect(white_king.symbol).to eq("\u2654".encode("utf-8"))
      expect(black_king.symbol).to eq("\u265A".encode("utf-8"))
    end
  end
end
