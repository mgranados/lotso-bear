# -*- encoding : utf-8 -*-
class ApplicationPolicy
  attr_reader :user

  def initialize(user)
    @user = user
  end

end
