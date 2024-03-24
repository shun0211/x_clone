class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet
                .order(created_at: :desc)
                .search(params[:keyword])
                .page(params[:page])

  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @reply_tweets = @tweet.replies
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def reply
    @tweet = Tweet.find(params[:id])
    @reply = Tweet.new
  end

  private

  def tweet_params
    params
      .require(:tweet)
      .permit(:content, :parent_tweet_id)
      .merge(user: current_user)
  end
end
