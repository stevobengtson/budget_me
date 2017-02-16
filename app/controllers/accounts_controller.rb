# frozen_string_literal: true
class AccountsController < ApplicationController
  before_action :set_account, only: %i(show edit update destroy)

  # GET /accounts
  def index
    @account = Account.new
    @accounts = policy_scope(Account)
  end

  # POST /accounts
  def create
    @account = Account.new(account_params.merge(user: current_user))

    if @account.save
      redirect_to transactions_url(account_id: @account.id), success: 'Account was successfully created.'
    else
      redirect_to transactions_url, alert: 'Error creating account.'
    end
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      redirect_to @account, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
    redirect_to transactions_url, notice: 'Account was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def account_params
    params.require(:account).permit(:name, :note, :balance, :account_type_id)
  end
end
