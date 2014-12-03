class DashboardController < ApplicationController
  # skip_before_action :authenticate_user!, :only => [:welcome]
  def index
    @user = current_user
    @video_link = Video.search
  end

  def welcome
    @user = User.new
  end
end
