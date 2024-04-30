json.extract! live_feed, :id, :title, :question_body, :asked_by, :created_at, :updated_at
json.url live_feed_url(live_feed, format: :json)
