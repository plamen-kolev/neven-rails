class ProductsController < ApplicationController
  before_action :get, only: [:show, :update, :destroy, :edit]

  def index
    @products = Product.all.each_slice(5)
  end

  def show
    
  end


  private
    def get
      @product = Product.find_by slug: params[:slug]
    end
end
