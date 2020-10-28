class Api::ProductsController < ApplicationController

  def display_all
    @all = Product.all

    render 'products.json.jb'
    
  end

  def display1
    @prod1 = Product.first

    render 'products.json.jb'
  end

  def display2
    @prod2 = Product.second

    render 'products.json.jb'
  end

  def display3
    @prod3 = Product.third

    render 'products.json.jb'
  end
end
          