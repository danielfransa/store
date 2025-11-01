class Inventory < ApplicationRecord
  belongs_to :sku
  belongs_to :local, optional: true
end
