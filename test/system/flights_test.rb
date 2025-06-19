require "application_system_test_case"

class FlightsTest < ApplicationSystemTestCase
  setup do
    @flight = flights(:one)
  end

  test "visiting the index" do
    visit flights_url
    assert_selector "h1", text: "Flights"
  end

  test "should create flight" do
    visit flights_url
    click_on "New flight"

    fill_in "Airline", with: @flight.airline
    fill_in "Destination", with: @flight.destination
    fill_in "Etd", with: @flight.etd
    fill_in "Flight no", with: @flight.flight_no
    fill_in "Gate", with: @flight.gate
    fill_in "Status", with: @flight.status
    fill_in "Std", with: @flight.std
    click_on "Create Flight"

    assert_text "Flight was successfully created"
    click_on "Back"
  end

  test "should update Flight" do
    visit flight_url(@flight)
    click_on "Edit this flight", match: :first

    fill_in "Airline", with: @flight.airline
    fill_in "Destination", with: @flight.destination
    fill_in "Etd", with: @flight.etd
    fill_in "Flight no", with: @flight.flight_no
    fill_in "Gate", with: @flight.gate
    fill_in "Status", with: @flight.status
    fill_in "Std", with: @flight.std
    click_on "Update Flight"

    assert_text "Flight was successfully updated"
    click_on "Back"
  end

  test "should destroy Flight" do
    visit flight_url(@flight)
    click_on "Destroy this flight", match: :first

    assert_text "Flight was successfully destroyed"
  end
end
