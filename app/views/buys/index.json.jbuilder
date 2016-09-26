json.array!(@buys) do |buy|
  json.extract! buy, :id, :user_id, :item_id
  json.url buy_url(buy, format: :json)
end
