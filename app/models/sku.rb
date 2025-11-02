class Sku < ApplicationRecord
  belongs_to :product
  has_many :inventories, dependent: :destroy
end
