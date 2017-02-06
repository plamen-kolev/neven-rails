class Product < ApplicationRecord
  belongs_to :category
  has_many :product_images
  has_many :product_options

  has_many :ingredients, :through => :ingredients_products
  has_many :ingredients_products
  

  before_save :slugify

  def price
    self.product_options.first.price
  end

  def option
    self.product_options.first
  end
  private 
    def slugify
      self.slug = self.title.parameterize
    end
end
