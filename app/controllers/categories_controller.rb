class CategoriesController < ApplicationController
  def show
    
    @category = Category.where(slug: params[:slug]).first
    @products = Product.where(category_id: @category.id).each_slice(5)
  end


end
