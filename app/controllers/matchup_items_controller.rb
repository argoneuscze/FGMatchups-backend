class MatchupItemsController < ApplicationController
  before_action :set_matchup_item, only: [:show]

  def index
    json_response(MatchupItem.all)
  end

  def show
    json_response(@matchup_item)
  end

  private

  def set_matchup_item
    @matchup_item = MatchupItem.find(params[:id])
  end
end
