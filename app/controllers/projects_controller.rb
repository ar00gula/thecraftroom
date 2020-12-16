class ProjectsController < ApplicationController
  before_action :logged_in, only: [:show, :edit, :update, :destroy]

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
    @supplies = Supply.all
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
 
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def logged_in
      if current_user
      else
        redirect_to '/signup'
      end
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :description)
    end
end
