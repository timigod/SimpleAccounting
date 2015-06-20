class Transaction < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :amount, :category, :kind, :description, :date
  self.per_page = 25
  
  
  def self.money_in_hand
    expense_models = self.where(:kind => "expense")
    total_expense = expense_models.sum("amount")
    
    income_models = self.where(:kind => "income")
    total_income = income_models.sum("amount")
    
    total_income - total_expense
  end
  
  def self.kind
    ['income', 'expense']
  end
end
