require 'test_helper'

class SidekicksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sidekicks_index_url
    assert_response :success
  end

  test "should get show" do
    get sidekicks_show_url
    assert_response :success
  end

  test "should get new" do
    get sidekicks_new_url
    assert_response :success
  end

  test "should get edit" do
    get sidekicks_edit_url
    assert_response :success
  end

end
