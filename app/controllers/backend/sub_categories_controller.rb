class Backend::SubCategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :get_subcategories
  before_action :set_sub_categories, only: [:edit, :update]
  before_action :get_categories

  layout 'backend'
  def index
    @subcategories = SubCategory.order(:category_id).page params[:page]
  end
  def new
    @subcategory = SubCategory.new
  end
  def create
    # call service subcategories
    @subcategory = SubCategoryService.create(params_subcategory)
    unless @subcategory.errors.any?
      redirect_to  backend_sub_categories_path, notice: "Sub category #{@subcategory.description} was created with success!"
    else
      render :new
    end
  end
  def edit
    #code
  end
  def update
      if @subcategory.update(params_subcategory)
        redirect_to backend_sub_categories_path, notice: "Sub category #{@subcategory.description} was updated with success!"
      else
        render :edit
      end
  end

  private
  def get_categories
    @categories = Category.all
  end
  def get_subcategories
    @subcategory = SubCategory.order(:category_id)
  end
  def set_sub_categories
    @subcategory = SubCategory.find_by(id: params[:id])
  end
  def params_subcategory
    params.require(:sub_category).permit(:description, :status, :category_id)
  end
end
