class ProjectsController < ApplicationController
  before_action :require_user, except: [:show, :index]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Project was successfully created!"
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      flash[:notice] = "Project was successfully updated!"
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    Project.destroy(params[:id])
    flash[:notice] = "Project was successfully destroyed!"
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
