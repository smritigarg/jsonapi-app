class Activity < ApplicationRecord
  validates   :name, presence: true
  belongs_to  :course
end
