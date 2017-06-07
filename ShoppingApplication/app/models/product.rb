class Product < ApplicationRecord
  belongs_to :type
  validates :name, :quantity, :price, presence: true
end
