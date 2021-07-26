class Api::V1::CourseResource < JSONAPI::Resource
  attributes :name, :self_assignable

  belongs_to  :coach
  has_many    :activities

  filter      :self_assignable
end
