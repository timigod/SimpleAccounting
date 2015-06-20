class Category < ActiveRecord::Base
  has_many :transactions
end
