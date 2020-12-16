class ProjectsController < ApplicationController
  before_action :logged_in, only: [:show, :new, :edit, :update, :destroy]

  def index
    @projects = Project.where(user: current_user)
  end

  def show
  end

  def new
    @project = Project.new
    @project.supplies.build
    @supplies = Supply.all
  end

  def edit
  end

  def create
    project = Project.new(project_params)
    project.user = current_user
    project.save

    redirect_to project
  end

  private
    def logged_in
      if current_user
      else
        redirect_to '/signup'
      end
    end

    def project_params
      params.require(:project).permit(:name, :user_id, :description, :reference_info, supply_ids:[], supplies_attributes: [:name, :description, :reference_info])
    end
end
