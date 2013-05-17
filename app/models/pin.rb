class Pin < ActiveRecord::Base
  attr_accessible :description, :image, :image_remote_url, :artist, :album, :date, :rank


  validates :description, presence: true
  validates :user_id, presence: true
  validates :artist, presence: true
  validates :album, presence: true
  validates :date, presence: true
  validates_attachment :image, presence: true,
  														 content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/gif', 'image/png'] },	
  														 size: { less_than: 5.megabytes }

  belongs_to :user
  has_attached_file :image, styles: { medium: "320x240>"}
  has_many :comments, dependent: :destroy

  def self.search(search)
    if search
      losearch = search.downcase
      find(:all, :conditions => ['lower(description) LIKE ? OR lower(artist) LIKE ? OR lower(album) LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%"], order: "created_at desc")
    else
      find(:all, order: "created_at desc")
    end
  end      
  
  def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end
end

