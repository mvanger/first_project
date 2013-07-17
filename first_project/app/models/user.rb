class User < ActiveRecord::Base
  attr_accessible :screenname, :email, :password
  has_and_belongs_to_many :pitchers
  has_and_belongs_to_many :teams
end