class MatchupsController < ApplicationController
  before_action :set_matchup, only: [:show]

  def show
    json_response(@matchup)
  end

  private

  def set_matchup
    @matchup = Matchup.find(params[:id])
  end
end
