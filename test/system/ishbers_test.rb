require "application_system_test_case"

class IshbersTest < ApplicationSystemTestCase
  setup do
    @ishber = ishbers(:one)
  end

  test "visiting the index" do
    visit ishbers_url
    assert_selector "h1", text: "Ishbers"
  end

  test "should create ishber" do
    visit ishbers_url
    click_on "New ishber"

    fill_in "Project", with: @ishber.project_id
    fill_in "Title", with: @ishber.title
    click_on "Create Ishber"

    assert_text "Ishber was successfully created"
    click_on "Back"
  end

  test "should update Ishber" do
    visit ishber_url(@ishber)
    click_on "Edit this ishber", match: :first

    fill_in "Project", with: @ishber.project_id
    fill_in "Title", with: @ishber.title
    click_on "Update Ishber"

    assert_text "Ishber was successfully updated"
    click_on "Back"
  end

  test "should destroy Ishber" do
    visit ishber_url(@ishber)
    click_on "Destroy this ishber", match: :first

    assert_text "Ishber was successfully destroyed"
  end
end
