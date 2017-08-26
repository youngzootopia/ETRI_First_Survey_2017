require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get finish_signup" do
    get home_finish_signup_url
    assert_response :success
  end

  test "should get finish_signup_non_email" do
    get home_finish_signup_non_email_url
    assert_response :success
  end

end
