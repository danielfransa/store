class Sale < ApplicationRecord
  belongs_to :client, optional: true
  has_many :sale_items, dependent: :destroy

  accepts_nested_attributes_for :sale_items, allow_destroy: true

  before_save :calculate_total_value

  private

  def calculate_total_value
    self.total_value = sale_items.sum do |item|
      item.quantity.to_i * item.unit_price.to_f
    end
  end
end
