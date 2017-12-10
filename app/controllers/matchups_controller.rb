class MatchupsController < ApplicationController
  before_action :set_matchup, only: [:show]

  def show
    json_response(@matchup)
  end

  def find_matchup
    @matchup = Matchup.find_by!(char_as_id: params[:id_as],
                                char_against_id: params[:id_against])
    show
  end

  private

  def set_matchup
    @matchup = Matchup.find(params[:id])
  end
end
