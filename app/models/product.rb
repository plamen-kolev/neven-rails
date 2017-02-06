class Product < ApplicationRecord
  belongs_to :category
  has_many :product_images
  has_many :product_options
  before_save :slugify

  def price
    self.product_options.first.price
  end
  private 
    def slugify
      self.slug = self.title.parameterize
    end
end
