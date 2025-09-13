# frozen_string_literal: true

class RolePolicy < ApplicationPolicy
  def index?
    admin?
  end

  def show?
    admin?
  end

  def create?
    admin?
  end

  def update?
    admin?
  end

  def destroy?
    admin? && record.users.empty?
  end

  class Scope < Scope
    def resolve
      if user.role.name == 'admin'
        scope.all
      else
        scope.none
      end
    end
  end

  private

  def admin?
    user.role.name == 'admin'
  end
end