class ProjectsController < ApplicationController
	skip_before_filter :require_login, only: [:index, :show]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    if current_user
      @transaction = @project.transactions.build
    end
  end

  def new
    @creator = current_user
    @project = Project.new
    10.times {@project.tiers.build}
  end

  def create
    @creator = current_user
    @project = @creator.projects.build(project_params) #sets creator_id properly??
    if @project.save
      redirect_to projects_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
