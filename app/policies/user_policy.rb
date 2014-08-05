class UserPolicy
  attr_reader :user

  def admin?
    user.admin?
  end
end
