class StopsController < ApplicationController
  def index
    @stops = Stop.all
  end

  def show
    @stop = Stop.find(params[:id])
    @lines = @stop.lines
  end
end
