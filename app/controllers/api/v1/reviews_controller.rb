class Api::V1::ReviewsController < ApplicationController

  def show
    review = Review.find(params[:id])
    render json: review
  end

  def index
      reviews = Review.all
      render json: reviews
  end

  def create
    review = Review.create(reviewParams)
    render json: review
  end

  def destroy
    review = Review.find(params[:id])
    review.delete
    render json: {}
  end

  private

  def reviewParams
    params.permit(:toilet_id, :content, :date, :name, :rating)
  end

end
