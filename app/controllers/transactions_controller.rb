# frozen_string_literal: true
class TransactionsController < ApplicationController
  before_action :ensure_accounts
  before_action :set_account, only: %i(index new)
  before_action :set_transaction, only: %i(show edit update destroy)

  # GET /transactions
  def index
    @transactions = policy_scope(Transaction).where(account: @account).order(occurred_at: :desc).page(params[:page])
  end

  # GET /transactions/1
  def show; end

  # GET /transactions/new
  def new
    @transaction = Transaction.new(account: @account, occurred_at: Time.zone.now.beginning_of_day)
  end

  # GET /transactions/1/edit
  def edit; end

  # POST /transactions
  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      redirect_to @transaction, notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      redirect_to @transaction, notice: 'Transaction was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy
    redirect_to transactions_url, notice: 'Transaction was successfully destroyed.'
  end

  private

  def ensure_accounts
    return true if current_user.accounts.count.positive?
    redirect_to accounts_url, notice: 'You need to create an account before accessing transactions'
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def transaction_params
    params.require(:transaction).permit(:account_id, :category_id, :occurred_at, :memo, :credit, :debit)
  end

  def set_account
    @account = Account.find(params[:account_id]) if params.key?(:account_id)
    @account ||= policy_scope(Account).first
    authorize @account, :show?
  end
end
