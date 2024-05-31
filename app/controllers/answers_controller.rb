class AnswersController < ApplicationController
  def new
    @live_feed = LiveFeed.new
  end

  def edit
    @live_feed = LiveFeed.find(params[:live_feed_id])
    @answer = @live_feed.answers.find(params[:id])
  end


  def update
    @live_feed = LiveFeed.find(params[:live_feed_id])
    @answer = @live_feed.answers.find(params[:id])
    
    if @answer.update(answer_params)
      redirect_to live_feed_path(@live_feed)
    else
      render :edit
    end
  end


  def create
    @live_feed = LiveFeed.find(params[:live_feed_id])
    @user = @live_feed.user
    @answer = @live_feed.answers.build(answer_params)
    @answer.user = current_user if user_signed_in?
    @answer.asked_by = current_user.username
    if @answer.save
      redirect_to live_feed_path(@live_feed)
    else
      render :new
    end
  end
  def destroy
  @live_feed = LiveFeed.find(params[:live_feed_id])
  @answer = @live_feed.answers.find(params[:id])
  @answer.destroy
  redirect_to live_feed_path(@live_feed)
end





  private

  def answer_params
    params.require(:answer).permit(:answer_body)
  end
end
