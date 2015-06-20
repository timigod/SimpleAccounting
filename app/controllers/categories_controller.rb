class CategoriesController < ApplicationController
  layout "main"
  load_and_authorize_resource
  before_action :set_category, only: [:destroy, :update]
  def index
    @category = Category.new
    @categories = Category.all
  end

  def new
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: "Category '#{@category.name}' was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :index, notice: "Error creating category, name cannot be blank" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_url, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :index }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #delete the category
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category '#{@category.name}' was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name)
  end
end

