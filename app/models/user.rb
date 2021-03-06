class User < ApplicationRecord

  acts_as_voter
  has_attached_file :avatar

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: '152x152#' }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :user_name, presence: true, length: { minimum: 4, maximum: 12 }

end
