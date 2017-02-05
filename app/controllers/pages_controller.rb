class PagesController < ApplicationController
  def index
    @slides = Slide.all
  end
end
