class TransactionsController < ApplicationController
  access user: :all, admin: :all
  
  def index
    @transactions = Transaction.where(params[:group_id])
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    if params[:group_id]
      @transactions = Transaction.where(params[:group_id])
    else
      []
    end
    @transaction = Transaction.new(params[:group_id])
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = current_user.id
    if @transaction.save
      redirect_to group_path(@transaction.group_id)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :user_id, :group_id)
  end
end
