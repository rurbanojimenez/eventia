class Event
  include Mongoid::Document
  belongs_to :mi_creador, class_name: "User", inverse_of: :mis_eventos
  has_and_belongs_to_many :followers, class_name: "User", inverse_of: :eventos_seguidos # usuarios pueden seguir eventos


  # Defino los fields
  field :title, type: String
  field :place, type: String
  field :date, type: Date
  field :description, type: String, default: ""

  # Restricciones...
  validates_presence_of :title
  validates_uniqueness_of :title # Títulos únicos
  # validates_presence_of :date
  validates_presence_of :mi_creador_id # Quiero que exista su creador

  # en rails 3 uso esto, en rails 4 usaré strong parameters
  attr_accessible :mi_creador_id, :title, :place, :date, :description
end