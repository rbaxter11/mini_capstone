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

  def display_query_action
    input_value = params["product_id"]
    @output = Product.find_by(id: input_value)
    render 'query.json.jb'
  end
  
  def display_url_action
    input_value = params["variable"]
    @output = Product.find_by(id: input_value)
    render 'query.json.jb'
  end

  def display_body_action
    input_value = params["product_id"]
    @output = Product.find_by(id: input_value)
    render 'query.json.jb'
  end

  def login
    input_name = params["name"]
    input_password = params["password"]
    if input_name == "hugh" && input_password == "swordfish"
      @output = "Valid credentials"
    else
      @output = "Invalid credentials"
    end
    render 'login.json.jb'
  end
end
          