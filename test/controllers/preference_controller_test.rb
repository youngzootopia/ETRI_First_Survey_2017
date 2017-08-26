require 'test_helper'

class PreferenceControllerTest < ActionDispatch::IntegrationTest
  test "should get get_html" do
    get preference_get_html_url
    assert_response :success
  end

  test "should get get_data" do
    get preference_get_data_url
    assert_response :success
  end

  test "should get survey_save" do
    get preference_survey_save_url
    assert_response :success
  end

end
