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
  #el follower id existe como usuario
  validate :follower_id_is_an_existing_user, on: :update

  # en rails 3 uso esto, en rails 4 usaré strong parameters
  attr_accessible :follower_id, :unfollower_id, :mi_creador_id, :title, :place, :date, :description

  before_update do
    if respond_to? :follower_id and self.follower_id
      #otra forma
      self.followers << User.find(follower_id)
      #self.follower_ids.add(follower_id)
    end
    if respond_to? :unfollower_id and self.unfollower_id
      self.follower_ids.delete_if{ |var| var.to_s == self.unfollower_id}
    end
  end

  private
    def follower_id_is_an_existing_user
      begin
        if respond_to? :follower_id
          User.find(self.follower_id)
        end
      rescue Mongoid::Errors::DocumentNotFound
        #NADA
        self.errors.add :follower_id, "this user_id does not exist"
      rescue Mongoid::Errors::InvalidFind
        #NADA
        #self.errors.add :follower_id, "this user_id does not exist"
      end
    end

end