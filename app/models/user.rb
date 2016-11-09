class User < ActiveRecord::Base
  has_secure_password

  has_many :lists, :dependent => :destroy
  has_many :tasks, :dependent => :destroy

  validates :username, :email, presence: true, uniqueness: true
validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

end
