json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :amount, :category_id, :description, :type
  json.url transaction_url(transaction, format: :json)
end
