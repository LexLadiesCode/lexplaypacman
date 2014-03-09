json.array!(@standings) do |standing|
  json.extract! standing, :id, :initials, :score, :player_id, :location
  json.url standing_url(standing, format: :json)
end
