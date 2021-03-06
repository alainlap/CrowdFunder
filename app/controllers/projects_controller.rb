class ProjectsController < ApplicationController
	skip_before_filter :require_login, only: [:index, :show]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @transaction = @project.transactions.build
  end

  def new
    @creator = current_user
    @project = Project.new({
      creator_id: @creator.id,
    })
    render "edit"
  end

  def create
    @creator = current_user
    @project = @creator.created_projects.build(project_params) #sets creator_id properly
    if @project.save
      redirect_to projects_path
    else
      render "new"
    end
  end

  
     
  def edit
    @project = Project.find(params[:id])
    @creator = @project.creator
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      @transaction = @project.transactions.build
      render :show
    end
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:name,:goal,:description,:projectpicture,:img,:end_date,:min_pledge,:website,:creator_id,tiers_attributes: [:id, :threshold, :reward_text, :initial_quantity])
  end
end

