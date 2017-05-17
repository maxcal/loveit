class PostPolicy < ApplicationPolicy

  alias_attribute :post, :record

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    author?
  end

  def destroy?
    author?
  end

  private

  def author?
    post.author == user
  end
end
