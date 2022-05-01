class OrderDetail < ApplicationRecord
    belongs_to :item
    belongs_to :order
    
    enum making_status: { impossible_making: 0, waiting_making: 1, making: 2, finish: 3 }
    

    
    def item_subtotal
      (self.price_tax * self.item_amount).round
    end
    
    
    
end
