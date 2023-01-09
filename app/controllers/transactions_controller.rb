class TransactionsController < ApplicationController
  
  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = current_user.id
    if @transaction.save
      redirect_to transactions_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :user_id)
  end
end
