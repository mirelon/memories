class Event < ApplicationRecord
  has_many :event_people
  has_many :people, through: :event_people
  has_many :resources
  accepts_nested_attributes_for :event_people, allow_destroy: true
  accepts_nested_attributes_for :people, allow_destroy: true
  accepts_nested_attributes_for :resources, allow_destroy: true

  def people_names
    people.map(&:name).join(',')
  end
end
