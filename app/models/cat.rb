class Cat < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  has_many_attached :images do |image|
    # image.variant :basic, resize_to_limit: [150, 150]
    image.variant :basic, resize_to_fill: [150, nil]
  end
end
