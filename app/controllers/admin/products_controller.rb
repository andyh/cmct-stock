class Admin::ProductsController < AuthenticatedController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authorize_resource

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice: "Product was successfully created."
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "Product was successfully updated."
    else
      render :edit
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :brand_id, :category_id, :size, :description, :price)
  end

  def resource
    @product || Product
  end
end
