require 'rails_helper'

RSpec.describe Move, type: :model do
  let(:user) { User.create(name: "John", email: "john@test.com", password: "password", password_confirmation: "password") }
  let(:game) { Game.create(turn: "white", user_id: user.id) }
  let(:white_queen) { Queen.create(game_id: game.id, side: "white", row: 1, column: 4, moved: false) }
  let(:white_king) { King.create(game_id: game.id, side: "white", row: 1, column: 5, moved: false) }
  let(:white_rook) { Rook.create(game_id: game.id, side: "white", row: 1, column: 8, moved: false) }
  let(:white_pawn_1) { Pawn.create(game_id: game.id, side: "white", row: 7, column: 2, moved: false) }
  let(:white_pawn_2) { Pawn.create(game_id: game.id, side: "white", row: 6, column: 6, moved: false) }
  let(:queen_move_1) { Move.new(game_id: game.id, piece_id: white_queen.id, to_row: 5, to_column: 8) }
  let(:queen_move_2) { Move.new(game_id: game.id, piece_id: white_queen.id, to_row: 1, to_column: 1) }
  let(:king_move_1) { Move.new(game_id: game.id, piece_id: white_king.id, to_row: 1, to_column: 7) }
  let(:pawn_promotion_move) { Move.new(game_id: game.id, piece_id: white_pawn_1.id, to_row: 8, to_column: 2) }
  let(:pawn_non_promotion_move) { Move.new(game_id: game.id, piece_id: white_pawn_2.id, to_row: 7, to_column: 6) }

  describe ".new" do
    it "takes a game_id, piece_id, to_row and to_column as arguments" do
      expect(queen_move_1).to be_a(Move)
      expect(queen_move_1.game_id).to eq(game.id)
      expect(queen_move_1.piece_id).to eq(white_queen.id)
      expect(queen_move_1.to_row).to eq(5)
      expect(queen_move_1.to_column).to eq(8)
    end
  end

  describe "castle_row" do
    it "should return the row of the castle" do
      expect(king_move_1.castle_row).to eq(1)
    end
  end

  describe "castle_type" do
    it "should return the type of castle" do
      expect(king_move_1.castle_type).to eq("kingside")
    end
  end

  describe "distance" do
    it "should return the vertical_change for a non-horizontal move" do
      expect(queen_move_1.distance).to eq(4)
    end

    it "should return the horizontal_change for a horizontal move" do
      expect(queen_move_2.distance).to eq(-3)
    end
  end

  describe "horizontal_change" do
    it "should return the horizontal distance traveled" do
      expect(queen_move_1.horizontal_change).to eq(4)
      expect(queen_move_2.horizontal_change).to eq(-3)
    end
  end

  describe "pawn_promotion?" do
    it "should return true if the pawn moves to the last row" do
      expect(pawn_promotion_move.pawn_promotion?).to be(true)
    end

    it "should return false if the pawn does not move to the last row" do
      expect(pawn_non_promotion_move.pawn_promotion?).to be(false)
    end
  end

  describe "vertical_change" do
    it "should return the vertical distance traveled" do
      expect(queen_move_1.vertical_change).to eq(4)
      expect(queen_move_2.vertical_change).to eq(0)
    end
  end

end
