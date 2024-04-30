class MyQuestionsController < ApplicationController
  def question
    @user = current_user
    @questions = @user.live_feeds
  end
end
