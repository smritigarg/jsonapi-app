class Coach < ApplicationRecord
  validates :name, presence: true
  has_many :courses

  before_destroy :transfer_courses_to_any_coach

  def transfer_courses_to_any_coach
    transfer_courses_to \
      Coach.select(:id).where.not(id: self.id).map(&:id).sample
  end

  def transfer_courses_to(coach_id)
    if coach_id.nil?
      errors.add(:id, 'cannot transfer courses to any other coach')
    else
      self.courses.update_all(coach_id: coach_id)
    end
  end
end
