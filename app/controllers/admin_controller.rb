class AdminController < ApplicationController
  layout 'admin/application'
  before_filter :authenticate_admin!
  def index
    @welcome= "Welcome #{current_admin.name}"
  end
end
