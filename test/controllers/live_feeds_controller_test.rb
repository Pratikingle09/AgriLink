require "test_helper"

class LiveFeedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @live_feed = live_feeds(:one)
  end

  test "should get index" do
    get live_feeds_url
    assert_response :success
  end

  test "should get new" do
    get new_live_feed_url
    assert_response :success
  end

  test "should create live_feed" do
    assert_difference("LiveFeed.count") do
      post live_feeds_url, params: { live_feed: { asked_by: @live_feed.asked_by, question_body: @live_feed.question_body, title: @live_feed.title } }
    end

    assert_redirected_to live_feed_url(LiveFeed.last)
  end

  test "should show live_feed" do
    get live_feed_url(@live_feed)
    assert_response :success
  end

  test "should get edit" do
    get edit_live_feed_url(@live_feed)
    assert_response :success
  end

  test "should update live_feed" do
    patch live_feed_url(@live_feed), params: { live_feed: { asked_by: @live_feed.asked_by, question_body: @live_feed.question_body, title: @live_feed.title } }
    assert_redirected_to live_feed_url(@live_feed)
  end

  test "should destroy live_feed" do
    assert_difference("LiveFeed.count", -1) do
      delete live_feed_url(@live_feed)
    end

    assert_redirected_to live_feeds_url
  end
end
