class ProductsController < ApplicationController
  def index
    @products = Product.all.each_slice(5)
  end
end
