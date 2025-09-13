# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def show?
    admin? || user == record
  end

  def create?
    admin?
  end

  def update?
    admin? || user == record
  end

  def destroy?
    admin? && user != record
  end

  class Scope < Scope
    def resolve
      if user.role.name == 'admin'
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end

  private

  def admin?
    user.role.name == 'admin'
  end
end