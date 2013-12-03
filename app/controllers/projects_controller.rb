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
    if current_user
      @creator = current_user
      @project = @creator.created_projects.build(project_params) #sets creator_id properly
      if @project.save
        redirect_to projects_path
      else
        render "new"
      end
    else
      redirect_to projects_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:name,:goal,:description,:img,:end_date,:min_pledge,:website,:creator_id,tiers_attributes: [:id, :threshold, :reward_text, :initial_quantity])
  end
end