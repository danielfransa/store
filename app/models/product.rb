class Product < ApplicationRecord
  has_many :skus, dependent: :destroy
end
