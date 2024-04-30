require "test_helper"

class MyQuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get question" do
    get my_questions_question_url
    assert_response :success
  end
end
