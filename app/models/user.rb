class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable #:recoverable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :image, :twitter, :lastfm, :status
  # attr_accessible :title, :body

  has_attached_file :image, styles: { small: "75x108>"}
  validates_attachment :image, presence: true,
  														 content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/gif', 'image/png'] },	
  														 size: { less_than: 5.megabytes }

  has_many :pins, :dependent => :destroy
  
  has_many :comments

  has_many :posts

  after_create :send_admin_mail
  
  def send_admin_mail
    MyMailer.welcome_email(self).deliver
  end

  extend FriendlyId
  friendly_id :name, use: :slugged
end
