class BartController < ApplicationController
  protect_from_forgery
  def index
  end

  def new
    erb :trip_planner
  end

  def create
    @origin = params[:trip].values[0]
    @destination = params[:trip].values[1]
    @time = params[:trip].values[2]
    erb :_your_trip
  end

  private
    def trip_params
      params.require(:trip).permit(:origin, :destination, :time)
    end

end
