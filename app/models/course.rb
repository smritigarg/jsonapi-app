class Course < ApplicationRecord
  validates   :name, presence: true

  belongs_to  :coach
  has_many    :activities, dependent: :destroy
end
