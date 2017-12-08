require 'rails_helper'

RSpec.describe 'Characters API', type: :request do
  let!(:characters) { create_list(:character, 10) }
  let(:valid_char_id) { characters.first.id }
  let(:invalid_char_id) { valid_char_id + 10 }

  describe 'GET /characters' do
    before { get '/characters' }

    it 'returns characters' do
      expect(json).not_to be_empty
      expect(json.size).to eq 10
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end
  end
end