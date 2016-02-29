class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:notice] = "Question created successfully"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Question wasn't created, check errors below."
      render :new
    end
  end

  def show
    @review = Review.new
  end

  def index
    @products = Product.order("price ASC").all
  end

  def edit
  end

  def update
    if @product.update product_params
      flash[:notice] = "Question updated successfully"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Question wasn't updated, check errors below."
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "Question deleted!"
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, {department_ids: []})
  end

  def find_product
    @product = Product.find params[:id]
  end
end
