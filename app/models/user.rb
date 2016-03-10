class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable


  def login(username, password)
    user = self.find_by_email(username)
    if user.present? && user.valid_password?(password)
      user.generate_token
      return user if user.save
    end
  end

  def generate_token
    self.access_token = SecureRandom.hex(20) # probability = 1 / (32 ** 32)
  end

end
