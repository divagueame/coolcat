class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: [:user, :moderator, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_fill: [35, 35]
  end
  
  has_many :cats, dependent: :destroy

  def set_default_role
    self.role ||= :user
  end 
end
