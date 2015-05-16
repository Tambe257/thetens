class Pin < ActiveRecord::Base
  attr_accessible :description, :image, :image_remote_url, :artist, :album, :date, :rank, :video, :video_html, :rating, :year, :title, :tag_list

  has_attached_file :image, styles: { :large => "500x500>", :medium => "320x240>", :small => "200x200>" }
  validates :description, presence: true
  validates :user_id, presence: true
  validates :artist, presence: true
  validates :album, presence: true
  validates :year, presence: true
  validates :rating, presence: true
  validates_attachment :image, presence: true,
  														 content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/gif', 'image/png'] },	
  														 size: { less_than: 5.megabytes }
  has_many :videos

  belongs_to :user
  
  has_many :comments, dependent: :destroy

  acts_as_taggable

  attr_accessible :tag_list # Lots of other fields in here as well, but not relevant

  acts_as_taggable_on :tags

  def self.search(search)
    if search
      losearch = search.downcase
      where('lower(artist) LIKE ? OR lower(album) LIKE ? OR lower(year) LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.to_s.downcase}%")
    end
  end      
  
  def image_remote_url=(url_value)
    self.image = URI.parse(url_value).to_s unless url_value.blank?
    super
  end


  auto_html_for :video do
    html_escape
    image
    youtube(:width => 400, :height => 250)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

  def to_param
    "#{id} #{album}".parameterize
  end

  def self.find_for_user(pin_id, user)
    user.admin? ? find(pin_id) : user.pins.find(pin_id)
  end
end

