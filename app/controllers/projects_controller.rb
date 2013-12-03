class ProjectsController < ApplicationController
	skip_before_filter :require_login, only: [:index, :show]

  def show
    @project = Project.find(params[:id])
  end

end
