class Post < ActiveRecord::Base
	attr_accessible :title, :body, :image, :video, :video_html

	has_attached_file :image, styles: { medium: "320x240>"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	has_many :videos
	has_many :blog_comments, dependent: :destroy
	
	belongs_to :user

	def self.search(search)
    if search
      losearch = search.downcase
      find(:all, :conditions => ['lower(title) LIKE ? OR lower(body) LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%"], order: "created_at desc")
    else
      find(:all, order: "created_at desc")
    end
  end 

  auto_html_for :video do
    html_escape
    image
    youtube(:width => 400, :height => 250)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
end
