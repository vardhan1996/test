class ProductsController < ShopifyApp::AuthenticatedController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @shop_product = ShopifyAPI::Product.new
    @shop_variants = ShopifyAPI::Variant.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @shop_product = ShopifyAPI::Product.new(
      :title => @product.name,
      :body_html =>  "<strong>#{@product.description}</strong>",
      :vendor => "Shopping Application",
      :product_type => Type.find(@product.type_id).name,
      :images => [],
      :variants => [ShopifyAPI::Variant.new(
        :price => @product.price,
        :inventory_quantity => @product.quantity
        )]
    )
    @shop_product.save

    if @shop_product.save
      flash[:success] = "Created successfully"
      @product.shop_product_id = @shop_product.id
      @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    @shop_product = ShopifyAPI::Product.find(@product.shop_product_id)

    if @product.update(product_params)
      @shop_product.title = @product.name
      @shop_product.body_html = @product.description
      @shop_product.product_type = Type.find(@product.type_id).name
      variants = @shop_product.variants
      variants.each do |variant|
        variant.price = @product.price
      end

      @shop_product.save
      flash[:success] = "Updated successfully"
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @shop_product = ShopifyAPI::Product.find(@product.shop_product_id)
    @product.destroy
    @shop_product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :type_id, :description, :quantity, :price)
  end

end
