class SupplyCategoriesController < ApplicationController
    def index
        @supply_categories = SupplyCategory.all
    end

    def create
        sc = SupplyCategory.create(sc_params)
        
        if supply.supply_category == SupplyCategory.find_by(name: "Create New")
            supply.supply_category = SupplyCategory.create(supply_category_params)
                #maybe add functionality that catches if you add a new category that already exists
            redirect_to supply_path(supply)
        else
          redirect_to supply_path(supply)
        end
    
    end
end
