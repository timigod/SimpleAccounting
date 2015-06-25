class HomeController < ApplicationController
  def check
    if User.all.blank?
      redirect_to '/first_time#index'
    else
      redirect_to '/users/sign_in'
    end
  end

  def first_time

  end

end
