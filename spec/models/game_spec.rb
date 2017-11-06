require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:user) { User.create(name: "John", email: "john@test.com", password: "password", password_confirmation: "password") }
  let(:game) { Game.new(turn: "white", user_id: user.id) }

  describe ".new" do
    it "takes a turn and user_id as arguments" do
      expect(game).to be_a(Game)
      expect(game.turn).to eq("white")
      expect(game.user_id).to eq(user.id)
    end
  end
end
