class DashboardController < ApplicationController
  def index
    @user = current_user
  end

  def add_widgets
    @user = current_user
    @widgets = @user.widgets
    @widget = @user.widgets.new
  end
end
