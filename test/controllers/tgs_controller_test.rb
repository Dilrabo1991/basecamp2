require "test_helper"

class TgsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tg = tgs(:one)
  end

  test "should get index" do
    get tgs_url
    assert_response :success
  end

  test "should get new" do
    get new_tg_url
    assert_response :success
  end

  test "should create tg" do
    assert_difference("Tg.count") do
      post tgs_url, params: { tg: { description: @tg.description, name: @tg.name, project_id: @tg.project_id } }
    end

    assert_redirected_to tg_url(Tg.last)
  end

  test "should show tg" do
    get tg_url(@tg)
    assert_response :success
  end

  test "should get edit" do
    get edit_tg_url(@tg)
    assert_response :success
  end

  test "should update tg" do
    patch tg_url(@tg), params: { tg: { description: @tg.description, name: @tg.name, project_id: @tg.project_id } }
    assert_redirected_to tg_url(@tg)
  end

  test "should destroy tg" do
    assert_difference("Tg.count", -1) do
      delete tg_url(@tg)
    end

    assert_redirected_to tgs_url
  end
end
