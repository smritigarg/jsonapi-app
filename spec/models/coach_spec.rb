require 'rails_helper'

RSpec.describe Coach, type: :model do
  # subject {build(:coach)}

  describe 'associations' do
    it { should have_many(:courses) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }

    context "after destroy callbacks are executed" do
      let(:coach) { create(:coach) }
      let(:course) { create(:course, coach_id: coach.id) }

      it "transfers courses on destroy" do
        expect(coach.id).to be > 0
        expect(course.id).to be > 0
        expect(course.coach_id).to be_eql coach.id
        expect { coach.destroy }.to_not raise_error
        expect(course.reload.coach_id).not_to be_eql coach.id
      end

      it "must keep a coach for any active course" do
        expect { Coach.destroy_all }.to raise_error(ActiveRecord::InvalidForeignKey)
      end
    end

  end
end
