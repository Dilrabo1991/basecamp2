require "test_helper"

class IshbersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ishber = ishbers(:one)
  end

  test "should get index" do
    get ishbers_url
    assert_response :success
  end

  test "should get new" do
    get new_ishber_url
    assert_response :success
  end

  test "should create ishber" do
    assert_difference("Ishber.count") do
      post ishbers_url, params: { ishber: { project_id: @ishber.project_id, title: @ishber.title } }
    end

    assert_redirected_to ishber_url(Ishber.last)
  end

  test "should show ishber" do
    get ishber_url(@ishber)
    assert_response :success
  end

  test "should get edit" do
    get edit_ishber_url(@ishber)
    assert_response :success
  end

  test "should update ishber" do
    patch ishber_url(@ishber), params: { ishber: { project_id: @ishber.project_id, title: @ishber.title } }
    assert_redirected_to ishber_url(@ishber)
  end

  test "should destroy ishber" do
    assert_difference("Ishber.count", -1) do
      delete ishber_url(@ishber)
    end

    assert_redirected_to ishbers_url
  end
end
