class ReviewsController < ApplicationController
  before_action :set_review, only: [ :show, :edit, :update, :destroy]
  def new
    @game = Game.find(params[:game_id])
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @review.game = Game.find(params[:game_id])
    @review.save
    redirect_to game_path(params[:game_id])
  end

  def edit
  end

  def update
    @review.update(params_review)
    redirect_to game_path(@review.game_id)
  end

  def destroy
    @game_id = @review.game_id
    @review.delete
    redirect_to game_path(@game_id)
  end

  protected

  def set_review
    @review = Review.find(params[:id])
  end

  def params_review
    params.require(:review).permit(:name, :content)
  end
end
