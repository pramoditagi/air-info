require "test_helper"

class FlightTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save flight with past STD" do
    flight = Flight.new(
      std: 1.hour.ago,
      etd: 1.hour.from_now,
      airline: "Test Airline",
      flight_no: "TA123",
      destination: "Test City",
      gate: "A1",
      status: "On Time"
    )
    assert_not flight.save
    assert_includes flight.errors[:std], "cannot be in the past"
  end

  test "should not save flight with past ETD" do
    flight = Flight.new(
      std: 1.hour.from_now,
      etd: 1.hour.ago,
      airline: "Test Airline",
      flight_no: "TA123",
      destination: "Test City",
      gate: "A1",
      status: "On Time"
    )
    assert_not flight.save
    assert_includes flight.errors[:etd], "cannot be in the past"
  end

  test "should save flight with future dates" do
    flight = Flight.new(
      std: 1.hour.from_now,
      etd: 2.hours.from_now,
      airline: "Test Airline",
      flight_no: "TA123",
      destination: "Test City",
      gate: "A1",
      status: "On Time"
    )
    assert flight.save
  end

  test "not_in_past scope should filter past flights" do
    # Create a past flight by first creating with valid dates, then updating
    past_flight = Flight.create!(
      std: 2.hours.from_now,
      etd: 3.hours.from_now,
      airline: "Past Airline",
      flight_no: "PA123",
      destination: "Past City",
      gate: "A1",
      status: "Departed"
    )
    # Update to past dates (bypassing validation for testing)
    past_flight.update_columns(std: 2.hours.ago, etd: 1.hour.ago)
    
    # Create a future flight
    future_flight = Flight.create!(
      std: 1.hour.from_now,
      etd: 2.hours.from_now,
      airline: "Future Airline",
      flight_no: "FA123",
      destination: "Future City",
      gate: "A2",
      status: "On Time"
    )
    
    not_in_past_flights = Flight.not_in_past
    
    assert_includes not_in_past_flights, future_flight
    assert_not_includes not_in_past_flights, past_flight
  end
end
