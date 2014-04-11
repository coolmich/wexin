json.array!(@msgs) do |msg|
  json.extract! msg, :id
  json.url msg_url(msg, format: :json)
end
