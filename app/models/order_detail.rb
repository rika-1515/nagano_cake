class OrderDetail < ApplicationRecord
    belongs_to :item
    belongs_to :order
    
    enum making_status: { impossible_making: 0, waiting_making: 1, making: 2, finish: 3 }
    
    def add_tax_price
      (self.price * 1.10).round
    end
    
    def item_subtotal
      (self.add_tax_price * self.item_amount).round
    end
    
end
