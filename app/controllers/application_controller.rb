# -*- encoding : utf-8 -*-
require "prawn/measurement_extensions"
class ApplicationController < ActionController::Base
  include Pundit
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

end
