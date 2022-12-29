require "application_system_test_case"

class TgersTest < ApplicationSystemTestCase
  setup do
    @tger = tgers(:one)
  end

  test "visiting the index" do
    visit tgers_url
    assert_selector "h1", text: "Tgers"
  end

  test "should create tger" do
    visit tgers_url
    click_on "New tger"

    fill_in "Tg", with: @tger.tg_id
    fill_in "Title", with: @tger.title
    click_on "Create Tger"

    assert_text "Tger was successfully created"
    click_on "Back"
  end

  test "should update Tger" do
    visit tger_url(@tger)
    click_on "Edit this tger", match: :first

    fill_in "Tg", with: @tger.tg_id
    fill_in "Title", with: @tger.title
    click_on "Update Tger"

    assert_text "Tger was successfully updated"
    click_on "Back"
  end

  test "should destroy Tger" do
    visit tger_url(@tger)
    click_on "Destroy this tger", match: :first

    assert_text "Tger was successfully destroyed"
  end
end
