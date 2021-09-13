class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password
  attr_reader   :errors

  def user
    user = User.find_by(email: @email)
    return user if user && user.authenticate(@password)

    nil
  end
end
