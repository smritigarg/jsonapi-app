require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'associations' do
    it { should belong_to(:coach).class_name('Coach') }
    it { should have_many(:activities) }
  end

  describe 'validations' do
    subject { build(:course) }
    it { should validate_presence_of(:name) }
  end
end
