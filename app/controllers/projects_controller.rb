class ProjectsController < ApplicationController
  before_action :logged_in

  def index
    @projects = Project.where(user: current_user)
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @categories = Category.all
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

    def project_params
      params.require(:project).permit(:name, :user_id, :description, :reference_info, supply_ids:[], supplies_attributes: [:name, :description, :reference_info])
    end
end
