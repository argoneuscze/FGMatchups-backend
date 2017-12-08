require 'rails_helper'

RSpec.describe 'Matchup Items API' do
  let!(:matchup_object) { create(:matchup) }
  let!(:items) { create_list(:matchup_item, 10, matchup_id: valid_matchup_id) }
  let(:valid_matchup_id) { matchup_object.id }
  let(:invalid_matchup_id) { valid_matchup_id + 1 }
  let(:valid_item_id) { items.first.id }
  let(:invalid_item_id) { valid_item_id + 10 }

  describe 'GET /matchups/:matchup_id/matchup_items' do
    context 'when matchup exists' do
      before { get "/matchups/#{valid_matchup_id}/matchup_items" }

      it 'returns matchup items' do
        expect(json).not_to be_empty
        expect(json.size).to eq 10
      end

      it 'returns 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when matchup does not exist' do
      before { get "/matchups/#{invalid_matchup_id}/matchup_items" }

      it 'returns 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns error message' do
        expect(json).not_to be_empty
        expect(json['message']).to match(/Couldn't find Matchup/)
      end
    end
  end

  describe 'GET /matchups/:matchup_id/matchup_items/:matchup_item_id' do
    context 'when matchup item exists' do
      before { get "/matchups/#{valid_matchup_id}/matchup_items/#{valid_item_id}" }

      it 'returns matchup item' do
        expect(json).not_to be_empty
        expect(json['id']).to eq valid_item_id
      end

      it 'returns 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when matchup item does not exist' do
      before { get "/matchups/#{valid_matchup_id}/matchup_items/#{invalid_item_id}" }

      it 'returns 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns error message' do
        expect(json).not_to be_empty
        expect(json['message']).to match(/Couldn't find MatchupItem/)
      end
    end
  end
end
