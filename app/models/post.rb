class Post < ActiveRecord::Base
	attr_accessible :title, :body, :image

	has_attached_file :image, styles: { medium: "320x240>"}


	belongs_to :user
end
