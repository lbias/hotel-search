class Api::V1::SuppliersController < ApiController
  before_action :find_supplier, only: [:show, :update, :destroy]

  def index
    @suppliers = Supplier.all
    render json: @suppliers
  end

  def show
    render json: @supplier
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      redirect_to @supplier, notice: 'Supplier was successfully created.'
      render json: :show, status: :created, location: @supplier
    else
      render :new
      render json: @supplier.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @supplier.update(supplier_params)
      redirect_to @supplier, notice: 'Supplier was successfully updated.'
      render json: :show, status: :ok, location: @supplier
    else
      render :edit
      render json: @supplier.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @supplier.destroy
    redirect_to suppliers_url, notice: 'Supplier was successfully destroyed.'
  end

  private
    def find_supplier
      @supplier = Supplier.find(params[:id])
    end

    def supplier_params
      params.fetch(:supplier, {})
    end
end
