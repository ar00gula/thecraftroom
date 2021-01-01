class CraftCategoriesController < ApplicationController
    before_action :logged_in?

    def index
        @craft_categories = CraftCategory.all
    end

    def show
        @category = CraftCategory.find(params[:id])
    end

end
