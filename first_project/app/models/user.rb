class User < ActiveRecord::Base

  attr_accessor :password
  before_save :encrypt_password

  validates :password, confirmation: true
  validates :password, presence: true, on: :create
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :screenname, presence: true
  validates :screenname, uniqueness: true

  attr_accessible :screenname, :email, :password, :password_confirmation

  has_and_belongs_to_many :pitchers
  has_and_belongs_to_many :teams

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(screenname, password)
    user = User.find_by_screenname(screenname)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end