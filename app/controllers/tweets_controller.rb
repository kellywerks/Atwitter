class TweetsController<ApplicationController
  def index
    @tweets = current_user.tweets
    @tweet =Tweet.new
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      respond_to do |format|
        format.html { redirect_to tweets_url }
        format.js
      end
    else
      render 'index'
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet,:user_id)
  end

end
