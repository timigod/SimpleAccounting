class OutstandingTransactionsController < ApplicationController
  layout "main", except: [:new, :edit]
  load_and_authorize_resource
  before_action :set_outstanding_transaction, only: [:show, :edit, :update, :destroy, :settle_outstanding]
  def index
    @debts = OutstandingTransaction.where("kind = ? AND settled = ?", "expense", false)
    @credits = OutstandingTransaction.where("kind = ? AND settled = ?", "income", false)
    @settled_outstanding_transactions = OutstandingTransaction.where(:settled => true)
  end

  def show
  end

  def new
    @outstanding_transaction = OutstandingTransaction.new
  end

  def edit
  end

  def create
    @outstanding_transaction = OutstandingTransaction.new(outstanding_transaction_params)
    respond_to do |format|
      if @outstanding_transaction.save
        format.html { redirect_to outstanding_transactions_path, notice: '#{get_transaction_type} transaction was successfully created.' }
        format.json { render :show, status: :created, location: @outstanding_transaction }
      else
        format.html { render :new }
        format.json { render json: @outstanding_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @outstanding_transaction.update(outstanding_transaction_params)
        format.html { redirect_to outstanding_transactions_path, notice: '#{get_transaction_type} transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @outstanding_transaction }
      else
        format.html { render :edit }
        format.json { render json: @outstanding_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @outstanding_transaction.destroy
    respond_to do |format|
      format.html { redirect_to outstanding_transactions_url, notice: 'Outstanding transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def settle_outstanding
    @transaction = Transaction.new(:amount => @outstanding_transaction.amount, :description => @outstanding_transaction.description, :kind => @outstanding_transaction.kind, :date => Date.today)
    if @outstanding_transaction.kind == "expense"
      @transaction.category = Category.find_by_name("Debt Settlement")
    else
      @transaction.category = Category.find_by_name("Credit Settlement")
    end
    @outstanding_transaction.settled = true
    respond_to do |format|
      if @transaction.save && @outstanding_transaction.save
        format.html { redirect_to transactions_path, notice: 'Transaction was successfully created and outstanding cleared' }
      else
        format.html { redirecto_to transactions_path}
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_outstanding_transaction
    @outstanding_transaction = OutstandingTransaction.find(params[:id])
  end
  
  def get_transaction_type
    if @outstanding_transaction.kind == "expense"
      return "Debt"
    elsif @outstanding_transaction.kind == "income"
      return "Credit"
    end
  end

  def outstanding_transaction_params
    params.require(:outstanding_transaction).permit(:amount, :description, :other_party, :kind)
  end
end
