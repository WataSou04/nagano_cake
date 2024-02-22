class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  enum production_status: { not_started: 0, waiting_production: 1, in_production: 2, completed: 3 }
  
  def with_tax_price
    (price * 1.1).floor
  end
  
  def subtotal
    item.with_tax_price * amount
  end
  
end
