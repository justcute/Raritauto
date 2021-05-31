class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  before_action :initialize_session
  before_action :load_cart, :load_user_cart

  def initialize_session
    if user_signed_in?
      session[:cart]||=[]
      session[:user_cart]||=[]
    end
  end

  def top_of_products
    @products = Product.search(params[:search]).order(:sch).reverse_order.page(params[:page])
  end

  def add_to_cart
    id = params[:id].to_i

    session[:cart] << id unless session[:cart].include?(id)
    redirect_to products_path
  end

  def get_cart_winner
    @products = []
    @products << Product.find(session[:cart].first)
    @products << Product.find(session[:cart].last)
    @products
  end

  def get_cart_winner_product
    id = params[:format]
    session[:cart] = []
    session[:cart] << id unless session[:cart].include?(id)
    p=Product.find(id)
    p.sch+=1
    p.save

    redirect_to products_path
  end

  def add_to_user_cart
    id = params[:id].to_i

    session[:user_cart] << id unless session[:user_cart].include?(id)
    redirect_to products_path
  end

  def remove_from_cart
    session[:cart].delete(params[:id].to_i)
    redirect_to products_path
  end

  def remove_from_user_cart
    session[:user_cart].delete(params[:id].to_i)
    redirect_to products_path
  end

  def load_cart
    if user_signed_in?
      @cart=Product.find(session[:cart])
    end
  end

  def load_user_cart
    if user_signed_in?
      @user_cart=Product.find(session[:user_cart])
    end
  end
  # GET /products or /products.json
  def index
    @products = Product.search(params[:search]).order(:title).reverse_order.page(params[:page])
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    authorize @product
  end

  # GET /products/1/edit
  def edit
    authorize @product
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        @product.save
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /products/1 or /products/1.json
  def destroy
    authorize @product
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.

    def product_params
      params.require(:product).permit(:title, :body, :avatar, :mark, :color,
      :engine, :search)
    end
end
