class LinesController < ApplicationController
  before_action :authenticate_user!
  def index
    @lines = Line.all
  end

  def show
    @line = Line.find(params[:id])
    @stops = @line.stops.order('line_stops.sequence ASC')
  end
end
