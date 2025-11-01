class Sku < ApplicationRecord
  belongs_to :product
  has_many :inventories, dependent: :destroy
  has_many :sale_items
end
