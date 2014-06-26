class TweetsController < ApplicationController
  def create
    @tweet=Tweet.new params[:tweet]
   unless @tweet.save
     flash[:error]=@tweet.errors.messages
   end
    redirect_to root_path
    puts @tweet.errors.messages
  end
  def retweet
    tweet=Tweet.find params[:id]
    
    unless current_user.tweets.create(:text=>tweet.text)
     flash[:error]=current_user.tweets.create(:text=>tweet.text).errors.messages
   end
    redirect_to root_path
  end
end
