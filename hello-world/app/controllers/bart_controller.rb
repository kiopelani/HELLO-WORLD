class BartController < ApplicationController
  protect_from_forgery except: :sign_in
  # protect_from_forgery
  def index
  end

  def new
    erb :trip_planner
  end

  def create
    p 'I AM HERE' * 500
    @origin = params[:trip].values[0]
    @destination = params[:trip].values[1]
    @time = params[:trip].values[2]
    p 'I AM ALIVE' * 500
    render 'test'
  end

  private
    def trip_params
      params.require(:trip).permit(:origin, :destination, :time)
    end

end
