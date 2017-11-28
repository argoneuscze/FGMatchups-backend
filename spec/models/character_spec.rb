require 'rails_helper'

RSpec.describe Character, type: :model do
  it { is_expected.to have_many(:matchups).dependent(:destroy) }
end
