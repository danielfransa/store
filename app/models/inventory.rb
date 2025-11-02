class Inventory < ApplicationRecord
  belongs_to :sku
  belongs_to :location, optional: true
end
