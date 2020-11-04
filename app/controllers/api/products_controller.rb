class Api::ProductsController < ApplicationController

  def index
    @all = Product.all
    render 'index.json.jb'
  end

  def show
    input_value = params["id"]
    @product = Product.find_by(id: input_value)
    render 'show.json.jb'
  end

  def create
    @product = Product.new ({
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
      color: params["color"],
    })
    if @product.save
    render 'show.json.jb'
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    product_id = params["id"]
    @product = Product.find_by(id: product_id)

    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.image_url = params["image_url"] || @product.image_url
    @product.description = params["description"] || @product.description
    @product.color = params["color"] || @product.color
    if @product.save
      render 'show.json.jb'
      else
        render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
      end
  end

  def delete
    product_id = params["id"]
    @product = Product.find_by(id: product_id)
    @product.destroy
    render json: {message: "Product successfully DESTROYYYYEEEEEDDDDD!"}
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
          