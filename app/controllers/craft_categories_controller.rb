class CraftCategoriesController < ApplicationController
    before_action :logged_in?

    def index
        @craft_categories = CraftCategory.all
    end

    def show
        @category = CraftCategory.find(params[:id])
    end

    def update
        user = current_user
        cat = CraftCategory.find(params[:id])

        if favorite_params[:favorite] == "true"
            if !user.craft_categories.include?(cat)
                user.craft_categories << cat
            else
                FavoriteCraftCategory.create(user_id: user.id, craft_category_id: cat.id)
            end
        else
            if user.craft_categories.include?(cat)
                user.craft_categories - [cat]
                if FavoriteCraftCategory.find_by(:craft_category_id => cat.id, :user_id => user.id)
                    FavoriteCraftCategory.find_by(:craft_category_id => cat.id, :user_id => user.id).destroy
                end
            end
            user.save
        end
        @message = "Updated!"
        @category = CraftCategory.find(params[:id])
        render :show 
    end

    private

    def favorite_params
        params.require(:craft_category).permit(:favorite)
    end

end