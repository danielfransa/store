class Inventory < ApplicationRecord
  belongs_to :sku
  belongs_to :location, optional: true
  has_many :sale_items, dependent: :destroy
end
