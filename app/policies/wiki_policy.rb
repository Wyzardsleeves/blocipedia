class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  #added checkpoint 10 ------------
  class Scope
    attr_reader :user, :scope

    def initializer(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user.role == 'admin'
        wikis = scope.all #if the user is an admin, show them all the wikis
      elsif user.role == 'premium'
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if wiki.access? || wiki.user_id == user.id #|| wiki.collaborators.include?(user)
            wikis << wiki
          end
        end
      else
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          if wiki.access? #|| wiki.collaborators.include?(user)
            wikis << wiki
          end
        end
      end
      wikis
    end
  end
  #--------------------------------

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
    user.id == @record.user_id
  end
end
