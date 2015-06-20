class UsersController < ApplicationController
  layout "main"
  load_and_authorize_resource
  before_action :set_user, only: [:destroy, :update]
  def index
    @user = user.new
    @users = user.all
  end

  def new
  end

  def create
    @user = user.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: "user '#{@user.name}' was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :index, notice: "Error creating user, name cannot be blank" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :index }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #delete the user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "user '#{@user.email}' was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = user.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
