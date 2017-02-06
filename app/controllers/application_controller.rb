class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_locale
  before_filter :get_categories

  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def get_categories
      @categories = Category.all
  end
end
