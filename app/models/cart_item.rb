class CartItem < ApplicationRecord
    
    has_one_attached :item_image
    belongs_to :customer
    belongs_to :item
    has_many :order_details, dependent: :destroy
    
    def get_item_image
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/NoImage.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_limit: [100, 100]).processed
    end
    
    def add_tax_price
      (self.item.price * 1.10).round
    end
    
    def item_subtotal
      (self.add_tax_price * self.amount).round
    end
    
end
