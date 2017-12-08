class MatchupsController < ApplicationController
  before_action :set_matchup, only: [:show]

  def index
    json_response(Matchup.all)
  end

  def show
    json_response(@matchup)
  end

  private

  def set_matchup
    @matchup = Matchup.find(params[:id])
  end
end
