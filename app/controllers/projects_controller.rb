class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :destroy, :update]

  def index
    @projects = Project.all_projects(current_user.id)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def destroy
  end

  private

  def set_project
  end

  def project_params
  end
end
