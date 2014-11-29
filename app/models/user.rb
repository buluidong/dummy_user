class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :email, format: {with: /^\w*@\w*.\w{3}/}, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true
  validates_length_of :password, :in => 6..20

  def self.authenticate(email, password)
  	user = User.find_by_email(email)
  	if user && user.password == password
  		return user
  	end
  	return nil
  end

end
