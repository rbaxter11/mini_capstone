class Api::ProductsController < ApplicationController

  def display_all
    @all = Product.all

    render 'products.json.jb'
    
  end
end
