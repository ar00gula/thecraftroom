class ProjectsController < ApplicationController
  before_action :logged_in, only: [:show, :new, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.where(user: current_user)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.supplies.build
    @supplies = Supply.all
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
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
