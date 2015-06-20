class OutstandingTransaction < ActiveRecord::Base
  
  def self.net_outstanding
    self.total_debt - self.total_credit
  end

  def self.total_debt
    debt_models = self.where(:kind => "expense", :settled => false)
    total_debt = debt_models.sum("amount")
  end

  def self.total_credit
    credit_models = self.where(:kind => "income", :settled => false)
    total_credit = credit_models.sum("amount")
  end

  def self.kind
    ['income', 'expense']
  end
end
