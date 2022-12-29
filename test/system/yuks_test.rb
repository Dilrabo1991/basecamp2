require "application_system_test_case"

class YuksTest < ApplicationSystemTestCase
  setup do
    @yuk = yuks(:one)
  end

  test "visiting the index" do
    visit yuks_url
    assert_selector "h1", text: "Yuks"
  end

  test "should create yuk" do
    visit yuks_url
    click_on "New yuk"

    fill_in "Project", with: @yuk.project_id
    click_on "Create Yuk"

    assert_text "Yuk was successfully created"
    click_on "Back"
  end

  test "should update Yuk" do
    visit yuk_url(@yuk)
    click_on "Edit this yuk", match: :first

    fill_in "Project", with: @yuk.project_id
    click_on "Update Yuk"

    assert_text "Yuk was successfully updated"
    click_on "Back"
  end

  test "should destroy Yuk" do
    visit yuk_url(@yuk)
    click_on "Destroy this yuk", match: :first

    assert_text "Yuk was successfully destroyed"
  end
end
