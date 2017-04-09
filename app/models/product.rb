class Product < ActiveRecord::Base
  validates :price, :name, presence: true
end
