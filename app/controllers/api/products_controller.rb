class Api::ProductsController < ApplicationController

  def display_all
    @all = Product.all

    render 'products.json.jb'
    
  end

  def display1
    @prod1 = Product.first

    render 'prod1.json.jb'
  end

  def display2
    @prod2 = Product.second

    render 'prod2.json.jb'
  end

  def display3
    @prod3 = Product.third

    render 'prod3.json.jb'
  end
end
          