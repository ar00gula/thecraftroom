class CraftsController < ApplicationController
  before_action :logged_in?

  def show
    @craft = Craft.find(params[:id])
  end

  def new
    @craft = Craft.new
    @craft_categories = CraftCategory.all
  end
  
  def create
    craft = Craft.create(craft_params)
    
    if craft.craft_category == CraftCategory.find_by(name: "Create New")
        craft.craft_category = CraftCategory.create(craft_category_params)
            #maybe add functionality that catches if you add a new category that already exists
        redirect_to crafts_new_add_supplies_path
    else
      redirect_to crafts_new_add_supplies_path
    end

  end

  #this leaves this open to tampering. what i want is a multipage form but i want to build this out before i ask about it)
  def edit
    @craft = Craft.find(params[:id])
    @supplies = Supply.all
    @supply_categories = SupplyCategory.all
    #want to add functionality so that you can select a supply category and only see those on your screen one at a time
    @craft.supplies.build
  end  
  
  def update
    craft = Craft.find(params[:id])
    array = craft_supplies_params[:supply_ids]
    array.each do |id|
      if id != nil
        CraftsSupply.create(supply_id: id, craft_id: params[:id])
      end
    end
    redirect_to 
  
  end

  def destroy
  end

  private

    def craft_params
      params.require(:craft).permit(:name, :notes)
    end

    def craft_supplies_params
      params.require(:craft).permit(supply_ids:[])
    end
    
  end
