class Post < ActiveRecord::Base
	attr_accessible :title, :body, :image

	has_attached_file :image, styles: { medium: "320x240>"}


	belongs_to :user

	 def self.searchblog(searchblog)
    if searchblog
      losearchblog = searchblog.downcase
      find(:all, :conditions => ['lower(title) LIKE ? OR lower(body) LIKE ?', "%#{searchblog.downcase}%", "%#{searchblog.downcase}%"], order: "created_at desc")
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
