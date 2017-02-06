class Ingredient < ApplicationRecord
  before_save :slugify
  has_many :products, :through => :ingredients_products
  has_many :ingredients_products

  private 
    def slugify
      self.slug = self.title.parameterize
    end
end
