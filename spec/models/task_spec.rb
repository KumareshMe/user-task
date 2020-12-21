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

		it "Only description should be present" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      subject = Task.new(title: "", description: "hello testing", user_id: user.id)
      expect(subject).not_to be_valid
    end

    it "title should be minimum of 3 characters" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      subject = Task.new(title: "aa", description: "hello testing", user_id: user.id)
      expect(subject).not_to be_valid
    end

    it "title should be maximum of 30 characters" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      subject = Task.new(title: "more than 35 characters. The name was automatically shortened for the", description: "hello testing", user_id: user.id)
      expect(subject).not_to be_valid
    end

    it "description should be minimum of 6 characters" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      subject = Task.new(title: "testing", description: "aaa", user_id: user.id)
      expect(subject).not_to be_valid
    end

    it "description should be maximum of 100 characters" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      subject = Task.new(title: "testing", description: "Hey hello this is kumaresh who have been from Madurai, Tamilnadu. Hey this is zaggle where I am working for almost two months as a backend trainee", user_id: user.id)
      expect(subject).not_to be_valid
    end

    it "title and description should be unique" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      subject = Task.new(title: "testing", description: "hello testing", user_id: user.id)
      subject.save
      subject2 = Task.new(title: "testing", description: "hello testing", user_id: user.id)
      expect(subject2).not_to be_valid
    end

    it "title should be unique" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      subject = Task.new(title: "testing", description: "hello testing", user_id: user.id)
      subject.save
      subject2 = Task.new(title: "testing", description: "hello testing1", user_id: user.id)
      expect(subject2).not_to be_valid
    end
    
    it "description should be unique" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      subject = Task.new(title: "testing", description: "hello testing", user_id: user.id)
      subject.save
      subject2 = Task.new(title: "testing1", description: "hello testing", user_id: user.id)
      expect(subject2).not_to be_valid
    end
	end

end