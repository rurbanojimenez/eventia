class Event
  include Mongoid::Document
  # Defino los fields
  field :title, type: String
  field :place, type: String
  field :date, type: Date
  field :desription, type: String, default: ""

  # Restricciones...
  validates_presence_of :title
  validates_presence_of :date

  # en rails 3 uso esto, en rails 4 usaré strong parameters
  attr_accessible :title, :place, :date, :description
end