class Pitcher < ActiveRecord::Base
  attr_accessible :mlb_id, :first, :last
  belongs_to :team
  belongs_to :user
  has_many :pitches
end