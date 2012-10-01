class AdminController < ApplicationController
  before_filter :authenticate_admin!
  #def index
  #  @welcome= "Welcome #{current_admin.email}"
  #end
end
