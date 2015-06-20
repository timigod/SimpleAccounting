json.array!(@outstanding_transactions) do |outstanding_transaction|
  json.extract! outstanding_transaction, :id, :amount, :description, :other_party, :kind
  json.url outstanding_transaction_url(outstanding_transaction, format: :json)
end
