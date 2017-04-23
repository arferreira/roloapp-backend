class Backend::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_category, only: [:edit, :update, :destroy]
  before_action :get_categories, only: [:new, :edit, :index, :create]
  layout 'backend'
  def index
    @categories = Category.order(:description).page params[:page]
  end
  def new
    @category = Category.new
  end
  def create
    @category = CategoryService.create(params_category)
    unless @category.errors.any?
      redirect_to backend_categories_path, notice: "#{@category.description} was created!"
    else
      render :new
    end
  end
  def edit
    #code
  end
  def update
    if @category.update(params_category)
      redirect_to backend_categories_path, notice: "#{@category.description} updated with success!"
    else
      render :edit
    end
  end
  def destroy
    #code
  end

  private

  def set_category
    @category = Category.find_by(id: params[:id])
  end

  def get_categories
    @categories = Category.all
  end

  def params_category
    params.require(:category).permit(:description, :status)
  end
end
