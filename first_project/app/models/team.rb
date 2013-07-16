class Team < ActiveRecord::Base
  attr_accessible :abbreviation, :city, :name
  has_many :pitchers
  has_and_belongs_to_many :users
end