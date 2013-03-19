require 'bcrypt'
class UserAuthenticator
  def initialize(user)
    @user = user
  end

  def authenticate(password)
   hash = @user && BCrypt::Password.new(@user.password)

   hash && hash == password ? @user : false
  end
end