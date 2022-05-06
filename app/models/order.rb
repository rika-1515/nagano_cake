class Order < ApplicationRecord
    has_many :order_details, dependent: :destroy
    belongs_to :customer
    
    
    enum status: { wait_payment: 0, confirm_payment: 1, making: 2, preparing_ship: 3, finish_prepare: 4 }
    enum pay_method: { credit_card: 0, transfer: 1 }
    
    accepts_nested_attributes_for :order_details, allow_destroy: true
    
    
    def total_amount
        amount = 0
        order_details.each do |o|
            amount = o.item_amount + amount
        end
        return amount
    end
    
    def subtotal_price
        price = 0
        order_details.each do |o|
            price = o.item_amount * o.price_tax + price
        end
        return price
    end
    
    
end

