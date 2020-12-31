class SuppliesController < ApplicationController
  before_action :logged_in?

  def index
    @categories = SupplyCategory.all
  end

  def show
    @supply = Supply.find(params[:id])
  end

  def new
    @supply = Supply.new
    @supply_categories = SupplyCategory.all
  end

  def edit
    @supply = Supply.find(params[:id])
    @supply_categories = SupplyCategory.all

  end

  def create
    supply = Supply.new(supply_params)
    supply.name = supply.name.capitalize
    supply.user_id = current_user.id
    supply.save

    if supply.supply_category == SupplyCategory.find_by(name: "Create New")
        supply.supply_category_id = SupplyCategory.create(supply_category_params[:category]).id
        supply.save
            #maybe add functionality that catches if you add a new category that already exists
        redirect_to supplies_path
    else
      redirect_to supplies_path
    end

  end

  def update
    supply = Supply.find(params[:id])
    supply.update(supply_params)
    if supply.supply_category == SupplyCategory.find_by(name: "Create New")
        supply.supply_category_id = SupplyCategory.create(supply_category_params[:category]).id
        supply.save
            #maybe add functionality that catches if you add a new category that already exists
        redirect_to supply_path(supply)
    else
      redirect_to supply_path(supply)
    end
  end

  def destroy
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_supply
    #   @supply = Supply.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def supply_params
      params.require(:supply).permit(:name, :notes, :supply_category_id, :in_stock)
    end

    def supply_category_params
      params.require(:supply).permit(category: [:name, :notes])
    end
end
