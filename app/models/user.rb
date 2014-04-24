class User
  include Mongoid::Document

  # has_many :events, dependent: :destroy # usuario crea evento
  has_many :mis_eventos, class_name: "Event", inverse_of: :mi_creador, dependent: :destroy
  has_and_belongs_to_many :eventos_seguidos, class_name: "Event", inverse_of: :followers # usuarios pueden seguir eventos
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""
  validates_presence_of :email
  validates_presence_of :encrypted_password
  validates_length_of :password, minimum: 8, maximum: 10

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  field :name, type: String, default: ""
  validates_presence_of :name
  # Ojocuidao que letras con tilde darían fallo
  validates_format_of :name, with: /[A-Z](\w)*/

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me


end
