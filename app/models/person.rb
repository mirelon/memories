class Person < ApplicationRecord
  has_many :event_people
  has_many :events, through: :event_people
  accepts_nested_attributes_for :event_people, allow_destroy: true

  def name
    "#{firstname} #{lastname}"
  end

  def event_count
    events.count
  end

end
