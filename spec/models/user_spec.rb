require "rails_helper"

RSpec.describe User, type: :model do

	describe "Validations" do

		# it "username, email, password has to be present" do
		# 	user = User.new(username: "blue", email: "blue@gmail.com", password: "passwordblue")
		# 	expect(user).to be_valid
		# end

		# it "username present and email absent" do
		# 	user = User.new(username: "blue", email: "", password: "passwordblue")
		# 	expect(user).not_to be_valid
		# end
		
		# it "username absent and email present" do
		# 	user = User.new(username: "", email: "blue@gmail.com", password: "passwordblue")
		# 	expect(user).not_to be_valid
		# end

		# it "username and email present, password absent" do
		# 	user = User.new(username: "blue", email: "blue@gmail.com", password: "")
		# 	expect(user).not_to be_valid
		# end

	end
end