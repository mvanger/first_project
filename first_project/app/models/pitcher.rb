class Pitcher < ActiveRecord::Base
  attr_accessible :mlb_id, :first, :last
  belongs_to :team
  has_and_belongs_to_many :users
  has_many :pitches
end