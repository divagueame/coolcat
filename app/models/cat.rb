class Cat < ApplicationRecord
  belongs_to :user
  has_many_attached :images


  has_many_attached :images do |image|
    # image.variant :basic, resize_to_limit: [nil, 300]
    image.variant :basic, resize_to_fill: [400, 500]
  end
  

end
