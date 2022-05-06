class Genre < ApplicationRecord
    has_many :items, dependent: :destroy
    validates :name, presence: true
    validates :name, uniqueness: true
    # validates :name, :uniqueness => true, :presence => true
end
