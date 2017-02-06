class ProductOption < ApplicationRecord
  before_save :slugify
  belongs_to :product
  private 
    def slugify
      self.slug = self.title.parameterize
    end
end
