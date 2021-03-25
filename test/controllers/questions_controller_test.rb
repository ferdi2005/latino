require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get question" do
    get questions_question_url
    assert_response :success
  end
end
