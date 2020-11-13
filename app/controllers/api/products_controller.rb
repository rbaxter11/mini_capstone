class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]
  
  def index
    p current_user
    
    
    # search = params[:search]
    # sort = params[:sort]
    # sort_order = params[:sort_order]
    # discount = params[:discount]

    # if sort == "price" && sort_order == "desc"
    #   @products = @products.order(price: :desc)
    # elsif discount == "true"
    #   @products = @products.where("price < 10")
    # elsif sort == "price"
    #   @products = @products.order(price: :asc)
    # elsif search
    #   @products = @products.where("name LIKE ?", "%#{search}%")
    # elsif sort == nil
    #   @products = @products.order(id: :asc)
    # end
    if params["category"]
      category = Category.find_by(name: params["category"])
      @products = category.products
    else
      @products = Product.all
    end
    render "index.json.jb"
  end

  def show
    input_value = params["id"]
    @product = Product.find_by(id: input_value)
    render "show.json.jb"
  end

  def create
    @product = Product.new ({
      name: params["name"],
      price: params["price"],
      description: params["description"],
      color: params["color"],
      supplier_id: params["supplier_id"]
    })
    if @product.save
      Image.create!({product_id: @product.id, url: params["url"]
      })
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    product_id = params["id"]
    @product = Product.find_by(id: product_id)

    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.description = params["description"] || @product.description
    @product.color = params["color"] || @product.color
    @product.image = params["image"] || @product.image
    # @product.supplier = params["supplier"] || @product.supplier
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def delete
    product_id = params["id"]
    @product = Product.find_by(id: product_id)
    @product.destroy
    render json: { message: "Product successfully DESTROYYYYEEEEEDDDDD!" }
  end

end
