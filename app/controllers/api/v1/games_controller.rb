class Api::V1::GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Game.order(updated_at: :desc)
  end

  def show
    render json: Game.find(params[:id]), serializer: GameShowSerializer
  end

  def create
    game = Game.create(JSON.parse(request.body.read))
    Rook.create(side: "white", row: 1, column: 1, moved: false, game_id: game.id)
    Knight.create(side: "white", row: 1, column: 2, moved: false, game_id: game.id)
    Bishop.create(side: "white", row: 1, column: 3, moved: false, game_id: game.id)
    Queen.create( side: "white", row: 1, column: 4, moved: false, game_id: game.id)
    King.create(side: "white", row: 1, column: 5, moved: false, game_id: game.id)
    Bishop.create(side: "white", row: 1, column: 6, moved: false, game_id: game.id)
    Knight.create(side: "white", row: 1, column: 7, moved: false, game_id: game.id)
    Rook.create(side: "white", row: 1, column: 8, moved: false, game_id: game.id)
    Pawn.create(side: "white", row: 2, column: 1, moved: false, game_id: game.id)
    Pawn.create(side: "white", row: 2, column: 2, moved: false, game_id: game.id)
    Pawn.create(side: "white", row: 2, column: 3, moved: false, game_id: game.id)
    Pawn.create(side: "white", row: 2, column: 4, moved: false, game_id: game.id)
    Pawn.create(side: "white", row: 2, column: 5, moved: false, game_id: game.id)
    Pawn.create(side: "white", row: 2, column: 6, moved: false, game_id: game.id)
    Pawn.create(side: "white", row: 2, column: 7, moved: false, game_id: game.id)
    Pawn.create(side: "white", row: 2, column: 8, moved: false, game_id: game.id)
    Pawn.create(side: "black", row: 7, column: 1, moved: false, game_id: game.id)
    Pawn.create(side: "black", row: 7, column: 2, moved: false, game_id: game.id)
    Pawn.create(side: "black", row: 7, column: 3, moved: false, game_id: game.id)
    Pawn.create(side: "black", row: 7, column: 4, moved: false, game_id: game.id)
    Pawn.create(side: "black", row: 7, column: 5, moved: false, game_id: game.id)
    Pawn.create(side: "black", row: 7, column: 6, moved: false, game_id: game.id)
    Pawn.create(side: "black", row: 7, column: 7, moved: false, game_id: game.id)
    Pawn.create(side: "black", row: 7, column: 8, moved: false, game_id: game.id)
    Rook.create(side: "black", row: 8, column: 1, moved: false, game_id: game.id)
    Knight.create(side: "black", row: 8, column: 2, moved: false, game_id: game.id)
    Bishop.create(side: "black", row: 8, column: 3, moved: false, game_id: game.id)
    Queen.create( side: "black", row: 8, column: 4, moved: false, game_id: game.id)
    King.create(side: "black", row: 8, column: 5, moved: false, game_id: game.id)
    Bishop.create(side: "black", row: 8, column: 6, moved: false, game_id: game.id)
    Knight.create(side: "black", row: 8, column: 7, moved: false, game_id: game.id)
    Rook.create(side: "black", row: 8, column: 8, moved: false, game_id: game.id)
  end
end
