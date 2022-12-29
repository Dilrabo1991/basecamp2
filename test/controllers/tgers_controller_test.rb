require "test_helper"

class TgersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tger = tgers(:one)
  end

  test "should get index" do
    get tgers_url
    assert_response :success
  end

  test "should get new" do
    get new_tger_url
    assert_response :success
  end

  test "should create tger" do
    assert_difference("Tger.count") do
      post tgers_url, params: { tger: { tg_id: @tger.tg_id, title: @tger.title } }
    end

    assert_redirected_to tger_url(Tger.last)
  end

  test "should show tger" do
    get tger_url(@tger)
    assert_response :success
  end

  test "should get edit" do
    get edit_tger_url(@tger)
    assert_response :success
  end

  test "should update tger" do
    patch tger_url(@tger), params: { tger: { tg_id: @tger.tg_id, title: @tger.title } }
    assert_redirected_to tger_url(@tger)
  end

  test "should destroy tger" do
    assert_difference("Tger.count", -1) do
      delete tger_url(@tger)
    end

    assert_redirected_to tgers_url
  end
end
