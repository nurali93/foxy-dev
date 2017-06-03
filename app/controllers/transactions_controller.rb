class TransactionsController < ApplicationController
  before_action :assign_operators

  def index; end

  def new
    binding.pry
    @trx = Transaction.new
  end

  def create
    @trx = current_user.transactions.build(tran_params)
    if @trx.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def assign_operators
    @operators = Operator.all
  end

  def tran_params
    params.require(:transaction).permit(:phone_number, :amount, :commission)
  end
end
