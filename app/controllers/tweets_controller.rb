class TweetsController < ApplicationController
  before_action :set_tweet, only:[:edit, :update, :destroy]

  def index
    # 新規投稿用 
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
    
    @tweets = Tweet.order('id desc') # 一覧表示用
  end

  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
      redirect_to tweets_path, notice:"新規ツイートを投稿しました。"
    else
      @tweets = Tweet.order('id desc') # 一覧表示用
      render "index" 
    end
  end

  def edit
  end

  def update
    if @tweet.update(tweets_params)
      redirect_to tweets_path, notice:"ツイートを編集しました。"
    else
      render "edit"
    end
  end

  def confirm
    @tweet = Tweet.new(tweets_params)
    if @tweet.invalid?
      @tweets = Tweet.order('id desc') # 一覧表示用
      render "index"
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice:"ツイートを削除しました。"
  end
  
  private 
    def tweets_params
      params.require(:tweet).permit(:content)
    end
    
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
end
