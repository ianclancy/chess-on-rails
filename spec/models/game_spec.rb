require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) { Game.new(turn: "white") }

  describe ".new" do
    it "takes a turn as an argument" do
      expect(game).to be_a(Game)
      expect(game.turn).to eq("white")
    end
  end
end
