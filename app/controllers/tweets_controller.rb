class TweetsController < ApplicationController
  def index
  	@tweets = Tweet.order('id DESC') #@tweets refers to view - display recent tweets
  	@tweet = Tweet.new #create new tweet object. Refers to view - (form_for)
  end

  def create
  	@tweet = Tweet.new(params[:tweet])
  	#add some validation
  	if @tweet.save
  		redirect_to :action => :index
  	else
  		@tweets = Tweet.order('id DESC')
  		render :action => :index

  	end
  end
end
