class LiveFeedsController < ApplicationController
  before_action :set_live_feed, only: %i[ show edit update destroy ]

  # GET /live_feeds or /live_feeds.json
  def index
    @live_feeds = LiveFeed.all
    @live_feed = LiveFeed.new
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

  private
    def set_live_feed
      @live_feed = LiveFeed.find(params[:id])
    end

    def live_feed_params
      params.require(:live_feed).permit(:title, :question_body, :asked_by)
    end
end
