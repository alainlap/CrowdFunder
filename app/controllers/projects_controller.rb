class ProjectsController < ApplicationController
	skip_before_filter :require_login, only: [:index, :show]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    #if current_user
      @transaction = @project.transactions.build
    #end
  end

  def new
    @creator = current_user
    @project = Project.new({
      creator_id: @creator.id,
      name: "Type your project name here",
      goal: 0,
      description: "Type your project description here.",
      img: ActionController::Base.helpers.asset_path('defaultprojectimage.png')
    })
    3.times do |i|
      @project.tiers.build({
        threshold: 0,
        reward_text: "Enter a reward here!",
        initial_quantity: 0
      })
    end
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

  def update
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:name,:goal,:description,:img,:end_date,:min_pledge,:website,:creator_id,tiers_attributes: [:id, :threshold, :reward_text, :initial_quantity])
  end
end

