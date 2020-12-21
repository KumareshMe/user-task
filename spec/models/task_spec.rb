require "rails_helper"

RSpec.describe Task, type: :model do

	describe "validations" do

		it "title and description should be present" do
			user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
			subject = Task.create!(title: "testing", description: "hello testing", user_id: user.id)
			expect(subject).to be_valid
		end

		it "Only title should be present" do
			user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
			subject = Task.new(title: "testing", description: "", user_id: user.id)
			expect(subject).not_to be_valid
		end

	end

end
