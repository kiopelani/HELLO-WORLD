class BartController < ApplicationController
  def index
  end

  get '/trip/plan' do
    erb :trip_planner
  end

  post '/trip/plan' do
    @origin = params[:trip].values[0]
    @destination = params[:trip].values[1]
    @time = params[:trip].values[2]
    erb :_your_trip
  end

end
