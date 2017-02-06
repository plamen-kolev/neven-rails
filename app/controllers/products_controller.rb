class ProductsController < ApplicationController
  before_action :get, only: [:show, :update, :destroy, :edit, :option_change]

  def index
    @products = Product.all.each_slice(5)
  end

  def show
    @option = @product.option
  end

  # post method for changing price of product
  def option_change
    @option = ProductOption.where(product_id: @product.id, slug: params[:option] ).first
    render :template => "products/show"
  end


  private
    def get
      @product = Product.find_by slug: params[:slug]
    end
end
