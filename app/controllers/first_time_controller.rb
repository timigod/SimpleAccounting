class FirstTimeController < ApplicationController
  def index
    if !User.all.blank?
      redirect_to '/users/sign_in'
    end
    @user = User.new

  end


  def create_user
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to new_user_session_path, notice: 'You can now sign in to use SimpleAccounting' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :index }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
