require "rails_helper"

RSpec.describe "UsersController", type: :request do

  describe "GET /index" do
    it "Users Index" do
      get users_path
      expect(response.body).to include("User-Task")
    end

    it "Index Test" do
      get "/users"
      expect(response.body).to include("User-Task")
    end
  end

  describe "GET /show" do
    it "Show User" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      get user_path(user)
      expect(response.body).to include("Assigned Tasks")
    end
  
    it "Test Show" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      get "/users/#{user.id}"
      expect(response.body).to include("Assigned Tasks")
    end 
  end

  describe "GET /new" do
    it "New User" do
      get signup_path
      expect(response.body).to include("Sign Up for User-Task")
    end

    it "New Test" do
      get "/signup"
      expect(response.body).to include("Sign Up for User-Task")
    end
  end

  describe "GET /edit" do
    it "Edit User" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      post login_path, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
      get edit_user_path(user)
      expect(response.body).to include("Edit your profile")
    end

    it "Edit Test" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      post login_path, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
      get "/users/#{user.id}/edit"
      expect(response.body).to include("Edit your profile")
    end
  end

    describe "POST /create" do
      it "Create User" do
        expect { post users_path, :params => { :user => { username: "blue", email: "blue@gmail.com", password: "passwordblue"}}}
                                                          .to change(User, :count).by(1)
        user = User.last
        expect(User.last.username).to eql("blue")
      end

      it "Create Test" do
        post "/users", :params => { :user => { username: "blue", email: "blue@gmail.com", password: "passwordblue"}}
        expect(response).to redirect_to(tasks_path)
      end

      it "Should render new if can't create user" do
        post users_path, :params => { :user => { username: "", email: "blue@gmail.com", password: "passwordblue"}}
        expect(response.body).to include("Sign Up for User-Task")
        expect(response.body).to include("The following errors prevented the user from being saved")
      end
    end

    describe "PATCH /update" do
      it "Update User" do
        user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
        post login_url, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
        patch user_path(user), :params => { :user => { username: "blues", email: "blues@gmail.com", password: "passwordblues"}}
        expect(User.last.username).to eql("blues")
      end

      it "Update User" do
        user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
        post login_url, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
        patch user_path(user), :params => { :user => { username: "blues", email: "blues@gmail.com", password: "passwordblues"}}
        expect(response).to redirect_to(user_path(user))
      end  
    
    it "Should render edit if can't update user" do
      post users_path, :params => { :user => { username: "", email: "blue@gmail.com", password: ""}}
      expect(response.body).to include("The following errors prevented the user from being saved")
    end
  end

    # describe "DELETE /destroy" do
    #   it "Delete User" do
    #     user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
    #     post login_path, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
    #     delete user_path(user)
    #     expect(session[:user.id]).to eql(nil)
    #   end

    #   it "Delete Test" do
    #     user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
    #     post login_path, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
    #     delete user_path(user)
    #     expect(response).to redirect_to(tasks_path)
    #   end
    # end
end