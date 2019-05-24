class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :destroy, :update]

  def index
    @projects = Project.all_projects(current_user.id)
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.create_project(project_params, current_user.id)
    redirect_to projects_path
  end

  def destroy
  end

  private

  def set_project
    @project = Project.single_project(current_user.id, params[:id])
  end

  def project_params
    params.require(:project).permit(:title)
  end
end
