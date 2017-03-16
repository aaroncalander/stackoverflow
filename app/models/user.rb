class User < ActiveRecord::Base

  validates :email, presence: true
  validates :email, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(input_password)
    self.hashed_password = input_password
    @password = BCrypt::Password.create(input_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    valid_user = User.find_by(email: email)
    valid_user.password == password ? valid_user : nil
  end

end
