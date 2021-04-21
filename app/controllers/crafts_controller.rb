class CraftsController < ApplicationController
  before_action :logged_in?

  def index
    @crafts = Craft.all
  end

  def show
    @craft = Craft.find(params[:id])
  end

  def new
    @craft = Craft.new 
       @category = CraftCategory.find_by(id: params[:craft_category_id])
    @craft_categories = CraftCategory.all

  end
  
  def create
    @craft = Craft.new(craft_params)
    
    if @craft.save
      redirect_to craft_category_craft_path(@craft.craft_category, @craft)

    else
      @craft_categories = CraftCategory.all
      render :new
    end
  end

  def edit
    @craft = Craft.find(params[:id])
    @supplies = Supply.all
    @supply_categories = SupplyCategory.all
    #want to add functionality so that you can select a supply category and only see those on your screen one at a time
  end  
  
  def update
    craft = Craft.find(params[:id])

    if craft.supplies
      craft_supplies_params[:supply_ids].each do |supply_id| #do this as model setter method
        if !supply_id.empty? && !craft.supplies.find_by_id(supply_id)
            craft.supplies << Supply.find_by_id(supply_id)
        end
  
        craft.supplies.each do |supply| #rails should do most of this for me - check documentation
          if !craft_supplies_params[:supply_ids].include?(supply.id.to_s)
              craft.supplies - [supply]
              if CraftsSupply.find_by(:supply_id => supply.id, :craft_id => craft.id)
              CraftsSupply.find_by(:supply_id => supply.id, :craft_id => craft.id).destroy
              end
          end
        end
      craft.save
      end
    
    else
        craft_supplies_params[:supply_ids].each do |id|
          if id != nil
            CraftsSupply.create(supply_id: id, craft_id: params[:id])
          end
        end
    end

    #   #this is not actually acting like it should? I want to be able to assign and unassign supplies, etc -- need to refer to my sinatra project
    redirect_to craft_category_craft_path(craft)
  
  end

  def destroy
  end

  private

    def craft_params
      params.require(:craft).permit(:name, :notes, :craft_category_id)
    end

    def craft_supplies_params
      params.require(:craft).permit(supply_ids:[])
    end

    
  end
