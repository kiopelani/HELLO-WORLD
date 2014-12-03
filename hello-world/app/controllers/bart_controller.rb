class BartController < ApplicationController
  # skip_before_filter :verify_authenticity_token
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  # protect_from_forgery except: :sign_in
  # protect_from_forgery
  def index
  end

  def new
    erb :trip_planner
  end

  def create
    p 'I AM HERE' * 500
    @origin = params.values[0]
    @destination = params.values[1]
    @time = params.values[2]
    p 'I AM ALIVE' * 500
    render 'test'
  end

  private
    def trip_params
      params.require(:trip).permit(:origin, :destination, :time)
    end

end
