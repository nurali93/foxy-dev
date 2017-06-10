class TransactionsController < ApplicationController
  before_action :assign_operators

  def index; end

  def new
    @trx = Transaction.new
  end

  def local_top_up
    @trx = Transaction.new
  end

  def international_top_up
    @trx = Transaction.new
  end

  def create
    @trx = current_user.transactions.build(tran_params)
    if @trx.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update; end

  private

  def assign_operators
    @operators = Operator.all
  end

  def tran_params
    params.require(:transaction).permit(:phone_number, :amount, :commission)
  end
end
