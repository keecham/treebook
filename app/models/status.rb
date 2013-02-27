class Status < ActiveRecord::Base
  attr_accessible :content, :text, :user_id
  belongs_to :user
end
