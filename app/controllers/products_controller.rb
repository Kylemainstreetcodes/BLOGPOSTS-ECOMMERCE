class ProductsController < ApplicationController
  def index
        if params[:category] && params[:category].length > 2
      @category_name = params[:category]
      @category = Category.where('name iLIKE ?', "%#{@tag_name}%")[0]

      if @category != nil
        @products = @category.products
      else
        @products = []
      end
      elsif params[:category] && params[:category].length < 3
      @error_message = "Enter a topic with 3 or more characters!!!"
      @products = Product.all
    else
      @products = Product.all
    end
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
      @categories = Category.all
      @product = Product.new
  end

  def create
    @product = Product.create(name: params[:name] , description: params[:description] , price: params[:price]

      if @product.save
        @product.create_categories(params[:category_ids]) if params[:category_ids]
      redirect_to("/products")
      else 
        @categories = Category.all
        render 'new'
      end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def update
    @product = Product.find(params[:id])
      if@product.update(name: params[:name] , description: params[:description] , price: params[:price]

    @product.update_categories(params[:category_ids]) if params[:category_ids]
    redirect_to "/products/#{@product.id}"
  else 
    @categories = Category.all
    render 'edit'
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to ("/products")
  end
end
