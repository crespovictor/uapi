class StatsController < ApplicationController
  before_action :set_stat, only: [:show, :update, :destroy]

  # GET /stats
  def index
    @stats = Stat.all

    json_response(@stats)
  end

  # GET /stats/1
  def show
    json_response(@stat)
  end

  # POST /stats
  def create
    @stat = Stat.create!(stat_params)
    json_response(@stat, :created)
  end


  # DELETE /stats/1
  def destroy
    @stat.destroy
    head :no_content
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_stat
    @stat = Stat.find(params[:id])
  end

    # Only allow a trusted parameter "white list" through.
  def stat_params
    params.permit(:online, :switch, :countdown, :current, :power, :voltage, :date_time)
  end
end