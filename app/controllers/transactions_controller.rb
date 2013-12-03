class TransactionsController < ApplicationController
  before_filter :require_login

  def create
    project = Project.find(params[:project_id])
    transaction = project.transactions.build(transaction_params)
    transaction.user_id = current_user.user_id
    transaction.tier_id = params([:tier_id])
    if transaction.save
      redirect_to project_path(project.id)
    else
      redirect_to project_path(project.id)
    end
  end

  def show
  end

  def update_tiers
    @project = Project.find(params[:project].to_i)
    @transaction = Transaction.new
    @amount = params[:amount].to_i
    respond_to do |format|
      format.js {}
    end
  end
end
