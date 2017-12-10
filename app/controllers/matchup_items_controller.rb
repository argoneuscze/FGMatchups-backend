class MatchupItemsController < ApplicationController
  before_action :set_matchup
  before_action :set_matchup_item, only: [:show, :update, :destroy]

  def index
    json_response(@matchup.matchup_items)
  end

  def show
    json_response(@matchup_item)
  end

  def create
    @matchup.matchup_items.create!(item_params)
    json_response(@matchup, :created)
  end

  def update
    @matchup_item.update!(item_params)
    json_response(@matchup_item, :ok)
  end

  def destroy
    @matchup_item.destroy!
  end

  private

  def item_params
    params.permit(:description)
  end

  def set_matchup
    @matchup = Matchup.find(params[:matchup_id])
  end

  def set_matchup_item
    @matchup_item = @matchup.matchup_items.find(params[:id])
  end
end
