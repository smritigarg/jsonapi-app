class Api::V1::CourseResource < JSONAPI::Resource
  attributes :name, :self_assignable

  has_one     :coach
  has_many    :activities

  filter      :self_assignable
end
