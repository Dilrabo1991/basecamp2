require "test_helper"

class YuksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @yuk = yuks(:one)
  end

  test "should get index" do
    get yuks_url
    assert_response :success
  end

  test "should get new" do
    get new_yuk_url
    assert_response :success
  end

  test "should create yuk" do
    assert_difference("Yuk.count") do
      post yuks_url, params: { yuk: { project_id: @yuk.project_id } }
    end

    assert_redirected_to yuk_url(Yuk.last)
  end

  test "should show yuk" do
    get yuk_url(@yuk)
    assert_response :success
  end

  test "should get edit" do
    get edit_yuk_url(@yuk)
    assert_response :success
  end

  test "should update yuk" do
    patch yuk_url(@yuk), params: { yuk: { project_id: @yuk.project_id } }
    assert_redirected_to yuk_url(@yuk)
  end

  test "should destroy yuk" do
    assert_difference("Yuk.count", -1) do
      delete yuk_url(@yuk)
    end

    assert_redirected_to yuks_url
  end
end
