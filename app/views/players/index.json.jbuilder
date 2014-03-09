json.array!(@players) do |player|
  json.extract! player, :id, :email, :twitter, :last_ip_address, :is_banned
  json.url player_url(player, format: :json)
end
