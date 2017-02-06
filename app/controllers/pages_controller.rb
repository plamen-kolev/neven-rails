class PagesController < ApplicationController
  def index
    @slides = Slide.all
    @hero = Hero.order("RANDOM()").first
    @products = Product.where(featured: true).each_slice(5)
    @stockists = Stockist.all.each_slice(5)
  end
end
