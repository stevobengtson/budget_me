# frozen_string_literal: true
class TransactionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:account).where(accounts: {user: user})
    end
  end

  def show?
    owner?
  end

  def create?
    user.present?
  end

  def new?
    user.present?
  end

  def update?
    owner?
  end

  def edit?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    record.user.present? && record.user == user
  end
end
