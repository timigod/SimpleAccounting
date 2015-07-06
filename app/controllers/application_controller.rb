class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  create_default_categories

  def after_sign_in_path_for(resource_or_scope)
    transactions_path
  end


  private

  def create_default_categories
    if Category.where(:name => 'Debt Settlement').exists?
      @cat_debt = Category.new(:name => 'Debt Settlement')
      @cat_debt.save
    end
    if Category.where(:name => 'Credit Settlement').exists?
      @cat_credit = Category.new(:name => 'Credit Settlement')
      @cat_credit.save
    end
  end
end
