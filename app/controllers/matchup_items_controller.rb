class MatchupItemsController < ApplicationController
  before_action :set_matchup
  before_action :set_matchup_item, only: [:show]

  def index
    json_response(@matchup.matchup_items)
  end

  def show
    json_response(@matchup_item)
  end

  private

  def set_matchup
    @matchup = Matchup.find(params[:matchup_id])
  end

  def set_matchup_item
    @matchup_item = @matchup.matchup_items.find(params[:id])
  end
end
