class Comment < ActiveRecord::Base
  attr_accessible :body, :pin_id, :author
  belongs_to :pin
end
