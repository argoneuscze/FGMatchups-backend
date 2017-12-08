require 'rails_helper'

RSpec.describe 'Matchups API' do
  let!(:matchups) { create_list(:matchup, 10) }
  let(:valid_matchup_id) { matchups.first.id }
  let(:invalid_matchup_id) { valid_matchup_id + 10 }

  describe 'GET /matchups' do
    before { get '/matchups' }

    it 'returns matchups' do
      expect(json).not_to be_empty
      expect(json.size).to eq 10
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /matchups/:id' do
    context 'when matchup exists' do
      before { get "/matchups/#{valid_matchup_id}" }

      it 'returns matchup' do
        expect(json).not_to be_empty
        expect(json['id']).to eq valid_matchup_id
      end

      it 'returns 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when matchup does not exist' do
      before { get "/matchups/#{invalid_matchup_id}" }

      it 'returns 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns error message' do
        expect(json['message']).to match(/Couldn't find Matchup/)
      end
    end
  end
end