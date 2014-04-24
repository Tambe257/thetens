class Comment < ActiveRecord::Base
  attr_accessible :body, :pin_id, :author

  validates_presence_of :user

  belongs_to :pin
  belongs_to :user
end
