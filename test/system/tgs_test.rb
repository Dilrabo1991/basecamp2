require "application_system_test_case"

class TgsTest < ApplicationSystemTestCase
  setup do
    @tg = tgs(:one)
  end

  test "visiting the index" do
    visit tgs_url
    assert_selector "h1", text: "Tgs"
  end

  test "should create tg" do
    visit tgs_url
    click_on "New tg"

    fill_in "Description", with: @tg.description
    fill_in "Name", with: @tg.name
    fill_in "Project", with: @tg.project_id
    click_on "Create Tg"

    assert_text "Tg was successfully created"
    click_on "Back"
  end

  test "should update Tg" do
    visit tg_url(@tg)
    click_on "Edit this tg", match: :first

    fill_in "Description", with: @tg.description
    fill_in "Name", with: @tg.name
    fill_in "Project", with: @tg.project_id
    click_on "Update Tg"

    assert_text "Tg was successfully updated"
    click_on "Back"
  end

  test "should destroy Tg" do
    visit tg_url(@tg)
    click_on "Destroy this tg", match: :first

    assert_text "Tg was successfully destroyed"
  end
end
