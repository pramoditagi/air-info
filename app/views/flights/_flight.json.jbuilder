json.extract! flight, :id, :std, :etd, :airline, :flight_no, :destination, :gate, :status, :created_at, :updated_at
json.url flight_url(flight, format: :json)
