class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    user.present?
  end

  def destroy?
    wikiMaker? || user.role == "admin"
  end

  #google binding.pry
  private

  def wikiMaker?
    #user.id == @record.user_id
    user.id == @record.user_id
  end
end