class Tweet < ActiveRecord::Base
  attr_accessible :text,:user_id
  # validates :text,:length=>{ maximum: 140 }
  belongs_to :user
end
