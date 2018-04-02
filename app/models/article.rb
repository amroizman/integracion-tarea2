class Article < ApplicationRecord
  #hasmany comments

  validates :title,
            presence: true

  validates :subtitle,
            presence: true,
            length: {maximum: 200}
            
  validates :body,
            presence: true

end
