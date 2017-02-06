class Product < ApplicationRecord
  belongs_to :category
  before_save :slugify

  private 
    def slugify
      self.slug = self.title.parameterize
    end
end
