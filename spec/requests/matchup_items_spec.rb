require 'rails_helper'

RSpec.describe 'Matchup Items API' do
  let!(:matchup_object) { create(:matchup) }
  let!(:items) { create_list(:matchup_item, 10, matchup_id: valid_matchup_id) }
  let(:valid_matchup_id) { matchup_object.id }
  let(:invalid_matchup_id) { valid_matchup_id + 1 }
  let(:valid_item_id) { items.first.id }
  let(:invalid_item_id) { valid_item_id + 10 }
  let(:valid_attrs) { { description: 'This is an item' } }

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

  describe 'POST /matchups/:matchup_id/matchup_items' do
    context 'when attributes are valid' do
      before { post "/matchups/#{valid_matchup_id}/matchup_items", params: valid_attrs }

      it 'adds the item' do
        MatchupItem.find_by!(valid_attrs)
      end

      it 'returns 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when attributes are invalid' do
      before { post "/matchups/#{valid_matchup_id}/matchup_items", params: {} }

      it 'returns error message' do
        expect(json).not_to be_empty
        expect(json['message']).to match(/Validation failed/)
      end

      it 'returns 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PATCH /matchups/:matchup_id/matchup_items/:matchup_item_id' do
    context 'when the attributes are valid' do
      before { patch "/matchups/#{valid_matchup_id}/matchup_items/#{valid_item_id}", params: valid_attrs }

      it 'updates the item' do
        item = MatchupItem.find(valid_item_id)
        expect(item.description).to eq valid_attrs[:description]
      end

      it 'returns 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the attributes are invalid' do
      before { patch "/matchups/#{valid_matchup_id}/matchup_items/#{valid_item_id}", params: { description: '' } }

      it 'returns error message' do
        expect(json).not_to be_empty
        expect(json['message']).to match(/Validation failed/)
      end

      it 'returns 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE /matchups/:matchup_id/matchup_items/:matchup_item_id' do
    before { delete "/matchups/#{valid_matchup_id}/matchup_items/#{valid_item_id}" }

    it 'deletes the record' do
      expect(MatchupItem.exists?(valid_item_id)).to be_falsey
    end

    it 'returns 204' do
      expect(response).to have_http_status(204)
    end
  end
end
