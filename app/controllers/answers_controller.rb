class AnswersController < ApplicationController
  def new
    @live_feed = LiveFeed.new
  end

  def create
    @live_feed = LiveFeed.find(params[:live_feed_id])
    @user = @live_feed.user
    @answer = @live_feed.answers.build(answer_params)
    @answer.user = current_user if user_signed_in?
    @answer.asked_by = @user.username
    if @answer.save
      # Create an alert for the user who asked the question
      @user.alerts.create(title: "#{current_user.username} answered your question posted on #{@live_feed.created_at.strftime("%d %b")}.",alert:"#{answer_params[:answer_body]}")
      redirect_to live_feed_path(@live_feed), notice: 'Answer posted successfully.'
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:answer_body)
  end
end
