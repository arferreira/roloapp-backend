class Backend::SubCategoriesController::SubCategoryService
  attr_accessor :sub_category
  def self.create(params_subcategory)
    @subcategory = SubCategory.new(params_subcategory)
    if @subcategory.valid?
      @subcategory.save
    end
    @subcategory
  end
end
