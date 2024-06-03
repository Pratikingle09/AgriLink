

class LiveFeedsController < ApplicationController
  before_action :set_live_feed, only: %i[ show edit update destroy like likes ]




  # GET /live_feeds or /live_feeds.json
  def index
    if user_signed_in?
    @live_feeds = LiveFeed.all
    @live_feed = LiveFeed.new

    @latitude = session[:latitude]
    @longitude = session[:longitude]

      begin
       respo = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?lat=#{@latitude}&lon=#{@longitude}&appid=d9ac7e81afaa607af356f9ce0db02af2")
       @weather =  JSON.parse(respo.body)

      rescue HTTParty::Error => e
       @error_message = "Failed to fetch weather data: #{e.message}"
      end

  else 
    redirect_to main_app.error_index_path
  end
  end

  # GET /live_feeds/1 or /live_feeds/1.json
  def show
    @live_feed = LiveFeed.find(params[:id])
    @answer = Answer.new
  end

  # GET /live_feeds/new
  def new
    @live_feed = LiveFeed.new
  end

  # GET /live_feeds/1/edit
  def edit
  end

  # POST /live_feeds or /live_feeds.json
  def create
    @live_feed = LiveFeed.new(live_feed_params)
    @live_feed.asked_by = current_user.id
    @live_feed.user_id = current_user.id


    respond_to do |format|
      if @live_feed.save
        format.html { redirect_to live_feeds_url, notice: "Live feed was successfully created." }
        format.json { render :show, status: :created, location: @live_feed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @live_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /live_feeds/1 or /live_feeds/1.json
  def update
    respond_to do |format|
      if @live_feed.update(live_feed_params)
        format.html { redirect_to live_feed_url(@live_feed), notice: "Live feed was successfully updated." }
        format.json { render :show, status: :ok, location: @live_feed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @live_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /live_feeds/1 or /live_feeds/1.json
  def destroy
      @live_feed.destroy!
      redirect_to live_feeds_url
  end


  def like
    if !current_user.liked? @live_feed
      @live_feed.liked_by current_user
    elsif current_user.liked? @live_feed
      @live_feed.unliked_by current_user
    end
    respond_to do |format|
      format.html { redirect_to live_feed_path }
      format.json { render json: { status: 'success' } }
    end
  end

  def likes
    if !current_user.liked? @live_feed
      @live_feed.liked_by current_user
    elsif current_user.liked? @live_feed
      @live_feed.unliked_by current_user
    end
    respond_to do |format|
      format.html { redirect_to live_feeds_path }
      format.json { render json: { status: 'success' } }
    end
  end






  private
    def set_live_feed
      @live_feed = LiveFeed.find(params[:id])
    end

    def live_feed_params
      params.require(:live_feed).permit(:post_image, :question_body, :asked_by)
    end
end
