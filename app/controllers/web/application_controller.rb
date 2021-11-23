class Web::ApplicationController < ApplicationController
  include AuthHelper
  before_action :authenticate_user!
  helper_method :current_user
end
