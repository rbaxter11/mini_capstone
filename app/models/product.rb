class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  # validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, length: { in: 10..500 }
  belongs_to :supplier
  has_many :images
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  # def image
  #   Image.where(product_id: id)
  # end

  
  def is_discounted?
    price <= 10
  end

  def tax
    price * 0.09
  end    

  def total
    price + tax
  end

end
         