class ProductPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    @current_user.admin?
  end

  def new?
    create?
  end

  def update?
    @current_user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    @current_user.admin?
  end
end
