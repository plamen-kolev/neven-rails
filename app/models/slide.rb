class Slide < ApplicationRecord
  def description
    if I18n.locale == 'en'
      return self.description_en
    else
      return self.description_nb
    end
  end
end
