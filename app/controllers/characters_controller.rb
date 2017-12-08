class CharactersController < ApplicationController
  before_action :set_character, only: [:show]

  def index
    json_response(Character.all)
  end

  def show
    json_response(@character)
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end
end
