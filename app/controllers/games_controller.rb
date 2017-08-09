class GamesController < ApplicationController
  before_action :set_game, only: [ :show, :edit, :update, :destroy ]
  def index
    @games = Game.all
  end

  def show

  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    redirect_to game_path(@game)
  end

  def edit
  end

  def update
    @game.update(game_params)
    redirect_to game_path(@game)
  end

  def destroy
    @game.destroy
    redirect_to games_path
  end

  protected

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit( :name, :description, :category )
  end
end
