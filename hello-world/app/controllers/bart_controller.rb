class BartController < ApplicationController

  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def index
  end

  def new
    erb :trip_planner
  end

  def create
    @origin = params.values[0]
    @destination = params.values[1]
    @time = params.values[2]
    render '_trip_info'
  end

  private
    def trip_params
      params.require(:trip).permit(:origin, :destination, :time)
    end

end
