class Pitch < ActiveRecord::Base
  attr_accessible :mph
  belongs_to :pitcher
end