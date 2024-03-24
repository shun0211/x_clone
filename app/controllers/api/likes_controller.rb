class Api::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    tweet = Tweet.find(params[:tweet_id])
    tweet.likes.create(user: current_user)
    render json: { like_count: tweet.likes.count }, status: :created
  end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    like = tweet.likes.find_by(user: current_user)
    like.destroy
    render json: { like_count: tweet.likes.count }, status: :ok
  end
end
