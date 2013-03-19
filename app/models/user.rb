class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  before_save :hash_password

  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, presence: {on: :create}


  #### ==== My Methods next ==== ####

  def hash_password
    if password.present?
      write_attribute(:password, BCrypt::Password.create(password))
    end
  end
end
