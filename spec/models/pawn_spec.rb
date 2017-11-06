require 'rails_helper'

RSpec.describe Pawn, type: :model do
  let(:user) { User.create(name: "John", email: "john@test.com", password: "password", password_confirmation: "password") }
  let(:game) { Game.create(turn: "white", user_id: user.id) }
  let(:white_pawn) { Pawn.create(game_id: game.id, side: "white", row: 2, column: 4, moved: false) }
  let(:black_pawn) { Pawn.create(game_id: game.id, side: "black", row: 3, column: 5, moved: false) }
  let(:moved_pawn) { Pawn.create(game_id: game.id, side: "white", row: 4, column: 1, moved: true) }
  let(:legal_move_1) { Move.new(game_id: game.id, piece_id: white_pawn.id, to_row: 3, to_column: 4) }
  let(:legal_move_2) { Move.new(game_id: game.id, piece_id: white_pawn.id, to_row: 4, to_column: 4) }
  let(:illegal_move_1) { Move.new(game_id: game.id, piece_id: white_pawn.id, to_row: 3, to_column: 3) }
  let(:illegal_move_2) { Move.new(game_id: game.id, piece_id: white_pawn.id, to_row: 5, to_column: 4) }
  let(:illegal_move_3) { Move.new(game_id: game.id, piece_id: white_pawn.id, to_row: 1, to_column: 4) }

  describe ".new" do
    it "takes a game_id, side, row, column and moved as arguments" do
      expect(white_pawn).to be_a(Pawn)
      expect(white_pawn).to be_a(Piece)
    end
  end

  describe "#legal_move?" do
    it "should return true for a legal move" do
      expect(white_pawn.legal_move?(legal_move_1)).to be(true)
      expect(white_pawn.legal_move?(legal_move_2)).to be(true)
    end

    it "should return false for an illegal move" do
      expect(white_pawn.legal_move?(illegal_move_1)).to be(false)
      expect(white_pawn.legal_move?(illegal_move_2)).to be(false)
      expect(white_pawn.legal_move?(illegal_move_3)).to be(false)
    end
  end

  describe "#symbol" do
    it "should return the correct symbol" do
      expect(white_pawn.symbol).to eq("\u2659".encode("utf-8"))
      expect(black_pawn.symbol).to eq("\u265F".encode("utf-8"))
    end
  end
end
