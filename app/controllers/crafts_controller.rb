class CraftsController < ApplicationController
  before_action :logged_in?, only: [:show, :new, :edit, :update, :destroy]

  def index
    @craft_categories = CraftCategory.all
  end

  def show
    @craft = Craft.find(params[:id])
  end

  def new
    @craft = Craft.new
    @craft_categories = CraftCategory.all
  end

  def edit
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
  def add_supplies
    @craft = Craft.last
    @supplies = Supply.all
    @supply_categories = SupplyCategory.all
    #want to add functionality so that you can select a supply category and only see those on your screen one at a time
    @craft.supplies.build
  end  
  
  def add_supplies_create
    craft = Craft.find(params[:craft_id])
    craft.supplies << craft_supplies_params
    
    if craft.craft_category == CraftCategory.find_by(name: "Create New")
        craft.craft_category = CraftCategory.create(craft_category_params)
            #maybe add functionality that catches if you add a new category that already exists
        redirect_to craft_path(craft)
    else
      redirect_to craft_path(craft)
    end
  end

  def update
  end

  def destroy
  end

  private

    def craft_params
      params.require(:craft).permit(:name, :notes, :craft_category_id)
    end

    def craft_category_params
      params.require(:craft).permit(:category, :notes, :name)
    end
    
  end
