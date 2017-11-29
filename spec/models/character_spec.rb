require 'rails_helper'

RSpec.describe Character, type: :model do
  it { is_expected.to have_many(:matchups).dependent(:destroy) }
  it { is_expected.to validate_presence_of :short_name }
  it { is_expected.to validate_uniqueness_of(:short_name).case_insensitive }
  it { is_expected.to validate_presence_of :full_name }
  it { is_expected.to validate_uniqueness_of(:full_name).case_insensitive }
end
