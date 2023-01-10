class TransactionsController < ApplicationController
  access user: :all, admin: :all
  
  def index
    @group = Group.find(params[:group_id])
    @transactions = Transaction.where(group_id: @group.id, user_id: current_user.id)
  end

  def show
    @transaction = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = current_user.id
    if @transaction.save
      # redirect_to group_path(@transaction.group_id)
      redirect_to transactions_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :user_id, :group_id)
  end
end
