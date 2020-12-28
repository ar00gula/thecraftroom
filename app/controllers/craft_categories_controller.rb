class CraftCategoriesController < ApplicationController
    before_action :logged_in?, only: [:show, :new, :edit, :update, :destroy]

    def index
    end

end
