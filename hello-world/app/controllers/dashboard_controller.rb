class DashboardController < ApplicationController
  def index
    @user = current_user
    @video_link = Video.search
  end
end
