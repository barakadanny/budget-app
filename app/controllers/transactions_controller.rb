class TransactionsController < ApplicationController
  access user: :all, admin: :all

  def index
    @group = Group.find(params[:group_id])
    @transactions = Transaction.where(group_id: @group.id, user_id: current_user.id).order(created_at: :desc)
    @transactions_sum = @transactions.sum(:amount)
  end

  def new
    @transaction = Transaction.new
    @categories = Category.where(user_id: current_user.id)
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = current_user.id
    if @transaction.save
      redirect_to group_transactions_path(@transaction.group_id)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private
  
  def transaction_params
    params.require(:transaction).permit(:name, :amount, :user_id, :group_id, category_ids: [])
  end
end
