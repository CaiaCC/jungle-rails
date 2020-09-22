class User < ActiveRecord::Base
	has_secure_password

	validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, length: { minimum: 5 }, uniqueness: {case_sensitive: false}
  validates :password, presence: true
	validates :password_confirmation, presence: true
	
	def authenticate_with_credentials(email, password) do
		if email.valid? && email.valid?
			user = User.new(user_params)
		else
			nil
		end
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end
end
