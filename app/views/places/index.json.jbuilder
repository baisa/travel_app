json.array!(@places) do |place|
  json.extract! place, :id, :name, :latitude, :longitude, :trip_id
  json.url place_url(place, format: :json)
end
