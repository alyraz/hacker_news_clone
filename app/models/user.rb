require 'digest'

class User < ActiveRecord::Base
  has_many :comments
  has_many :posts
  has_many :commentvotes
  has_many :postvotes

  before_create :encrypt_password

  def authenticate(password)
    self.password == Digest::MD5.hexdigest(password)
  end

  private 
  def encrypt_password
      self.password = Digest::MD5.hexdigest(self.password)
    end

end
