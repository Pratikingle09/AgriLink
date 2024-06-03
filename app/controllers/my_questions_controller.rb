class MyQuestionsController < ApplicationController
  def question
    @user = current_user
    @questions = @user.live_feeds

    @latitude = session[:latitude]
    @longitude = session[:longitude]

      begin
       respo = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?lat=#{@latitude}&lon=#{@longitude}&appid=d9ac7e81afaa607af356f9ce0db02af2")
       @weather =  JSON.parse(respo.body)

      rescue HTTParty::Error => e
       @error_message = "Failed to fetch weather data: #{e.message}"
      end
  end
end
