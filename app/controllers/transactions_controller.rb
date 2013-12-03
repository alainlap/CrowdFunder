class TransactionsController < ApplicationController
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
end
