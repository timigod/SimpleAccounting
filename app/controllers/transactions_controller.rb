class TransactionsController < ApplicationController
  layout "main", :except => [:new, :edit]
  load_and_authorize_resource
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :set_transactions, only: [:index, :update, :create]
  # GET /transactions
  # GET /transactions.json
  def index
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    redirect_to action: "index"
  end

  def new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transactions_path, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :index }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transactions_path, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :index }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def set_transactions
    @transactions = Transaction.paginate(:page => params[:page]).order("date DESC").order("id DESC")
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :category_id, :description, :kind, :date)
  end
end
