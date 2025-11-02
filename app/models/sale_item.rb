class SaleItem < ApplicationRecord
  belongs_to :sale
  belongs_to :inventory

  before_save :calculate_total

  private

  def calculate_total
    self.total_price = quantity * unit_price if quantity && unit_price
  end
end
