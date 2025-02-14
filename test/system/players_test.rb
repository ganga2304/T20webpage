require "application_system_test_case"

class PlayersTest < ApplicationSystemTestCase
  setup do
    @player = players(:one)
  end

  test "visiting the index" do
    visit players_url
    assert_selector "h1", text: "Players"
  end

  test "should create player" do
    visit players_url
    click_on "New player"

    fill_in "Description", with: @player.description
    check "Is active" if @player.is_active
    check "Is captain" if @player.is_captain
    fill_in "Name", with: @player.name
    fill_in "Role", with: @player.role
    click_on "Create Player"

    assert_text "Player was successfully created"
    click_on "Back"
  end

  test "should update Player" do
    visit player_url(@player)
    click_on "Edit this player", match: :first

    fill_in "Description", with: @player.description
    check "Is active" if @player.is_active
    check "Is captain" if @player.is_captain
    fill_in "Name", with: @player.name
    fill_in "Role", with: @player.role
    click_on "Update Player"

    assert_text "Player was successfully updated"
    click_on "Back"
  end

  test "should destroy Player" do
    visit player_url(@player)
    click_on "Destroy this player", match: :first

    assert_text "Player was successfully destroyed"
  end
end
