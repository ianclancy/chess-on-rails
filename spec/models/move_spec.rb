require 'rails_helper'

RSpec.describe Move, type: :model do
  let(:game) { Game.create(turn: "white") }
  let(:piece) { Queen.create(game_id: game.id, side: "white", row: 1, column: 4, moved: false) }
  let(:move) { Move.new(game_id: game.id, piece_id: piece.id, to_row: 4, to_column: 7) }

  describe ".new" do
    it "takes a game_id, piece_id, to_row and to_column as arguments" do
      expect(move).to be_a(Move)
      expect(move.game_id).to eq(game.id)
      expect(move.piece_id).to eq(piece.id)
      expect(move.to_row).to eq(4)
      expect(move.to_column).to eq(7)
    end
  end
end
