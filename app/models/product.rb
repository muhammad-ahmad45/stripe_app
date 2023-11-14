class Product < ApplicationRecord
  validates :title, :price, :total_quantity, presence: true
end
