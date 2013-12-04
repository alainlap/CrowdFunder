class TransactionsController < ApplicationController
  before_filter :require_login

  def create
    @transaction = Transaction.new
    @project = Project.find(params[:project])
    @transaction.project_id = params[:project]
    @transaction.dollar_amount = params[:amount].to_i
    @transaction.user_id = current_user.id
    @transaction.tier_id = params[:tier]
    @transaction.save
  end

  def update_tiers
    @project = Project.find(params[:project].to_i)
    @transaction = Transaction.new
    @amount = params[:amount].to_i
    respond_to do |format|
      format.js {}
    end
  end

  private
  def transaction_params
    params.require(:transaction).permit(:amount, :project, :tier, :dollar_amount)
  end

end
