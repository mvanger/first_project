class User < ActiveRecord::Base
  has_many :pitchers
  has_many :teams
end