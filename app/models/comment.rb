class Comment < ActiveRecord::Base
  attr_accessible :body, :pin_id
  belongs_to :pin
end
