class Category < ApplicationRecord
  before_save :slugify
  has_many :products
  
  private
    def slugify
      self.slug = self.title.parameterize
    end

end
