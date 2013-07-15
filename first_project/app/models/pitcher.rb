class Pitcher < ActiveRecord::Base
  belongs_to :team
  has_many :pitches
end