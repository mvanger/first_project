class Team < ActiveRecord::Base
  has_many :pitchers
  belongs_to :users
end