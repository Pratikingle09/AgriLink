require "application_system_test_case"

class LiveFeedsTest < ApplicationSystemTestCase
  setup do
    @live_feed = live_feeds(:one)
  end

  test "visiting the index" do
    visit live_feeds_url
    assert_selector "h1", text: "Live feeds"
  end

  test "should create live feed" do
    visit live_feeds_url
    click_on "New live feed"

    fill_in "Asked by", with: @live_feed.asked_by
    fill_in "Question body", with: @live_feed.question_body
    fill_in "Title", with: @live_feed.title
    click_on "Create Live feed"

    assert_text "Live feed was successfully created"
    click_on "Back"
  end

  test "should update Live feed" do
    visit live_feed_url(@live_feed)
    click_on "Edit this live feed", match: :first

    fill_in "Asked by", with: @live_feed.asked_by
    fill_in "Question body", with: @live_feed.question_body
    fill_in "Title", with: @live_feed.title
    click_on "Update Live feed"

    assert_text "Live feed was successfully updated"
    click_on "Back"
  end

  test "should destroy Live feed" do
    visit live_feed_url(@live_feed)
    click_on "Destroy this live feed", match: :first

    assert_text "Live feed was successfully destroyed"
  end
end
