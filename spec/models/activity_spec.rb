require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'associations' do
    it { should belong_to(:course).class_name('Course') }
  end

  describe 'validations' do
    subject { build(:activity) }
    it { should validate_presence_of(:name) }
  end
end
