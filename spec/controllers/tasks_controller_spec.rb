require "rails_helper"

RSpec.describe "TasksController", type: :request do

	describe "GET /index" do
		it "Index Task" do
			get tasks_path
			expect(response.body).to include("Listing all Tasks")
		end

    it "Index Test" do
			get "/tasks"
			expect(response.body).to include("Listing all Tasks")
		end
	end

	describe "GET /show" do
		it "Show Task" do
			user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
			task = Task.create!(title: "testing", description: "hello testing", user_id: user.id)
			get task_path(task)
			expect(response.body).to include(task.title)
		end

    it "Show Test" do
			user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
			task = Task.create!(title: "testing", description: "hello testing", user_id: user.id)
			get "/tasks/#{task.id}"
			expect(response.body).to include(task.title)
		end
	end

	describe "GET /new" do
		it "New Task" do
			user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
			post login_path, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
			get new_task_path
			expect(response.body).to include("Create a New Tasks")
		end

		it "New Test" do
			user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
			post login_path, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
			get "/tasks/new", :params => {}
			expect(response.body).to include("Create a New Tasks")
		end
	end

	describe "GET /edit" do
		it "Edit Task" do
			user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
			task = Task.create!(title: "testing", description: "hello testing", user_id: user.id)
			post login_url, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
			get edit_task_path(task)
			expect(response.body).to include("Edit Tasks")
		end
  
		it "Edit Test" do
			user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
			task = Task.create!(title: "testing", description: "hello testing", user_id: user.id)
			post login_path, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
			get "/tasks/#{task.id}/edit"
			expect(response.body).to include("Edit Tasks")
		end
	end

  describe "POST /create" do
    it "Create Task" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      post login_url, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
      expect {post tasks_path, :params => { :task => {title: "testing", description: "hello testing" }}}
                                            .to change(Task, :count).by(1)
      task = Task.last
      expect(Task.last.title).to eql("testing")
    end

    it "Create Test" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      post login_url, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
      expect {post "/tasks", :params => { :task => {title: "testing", description: "hello testing" }}}
                                            .to change(Task, :count).by(1)
      task = Task.last
      task2 = Task.create!(title: "testing1", description: "hello testing1", user_id: user.id)
      expect(response).to redirect_to(task_path(task)) 
    end

    it "Should render new if can't create task" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      post login_url, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
      post "/tasks", :params => { :task => {title: "testing", description: "" }}
      expect(response.body).to include("Create Task")
    end
  end

  describe "PATCH /update" do
    it "Update Task" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      post login_url, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
      task = Task.create!(title: "testing", description: "hello testing", user_id: user.id)
      patch task_path(task), :params => { :task => {title: "testing1", description: "hello testing1" }}
      expect(Task.last.title).to eql("testing1")
    end

    it "Update Test" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      post login_url, :params => { :session => {email: "blue@gmail.com", password: "passwordblue" }}
      task = Task.create!(title: "testing", description: "hello testing", user_id: user.id)
      patch "/tasks/#{task.id}", :params => { :task => {title: "testing1", description: "hello testing1" }}
      expect(response).to redirect_to(task_path(task))
    end

    it "Should render edit if can't edit task" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      post login_url, :params => { :session => {email: "blue@gmail.com", password: "passwordblue" }}
      post "/tasks", :params => { :task => {title: "testing", description: "" }}
      expect(response.body).to include("The following errors prevented the task from being saved")
    end      
  end

  describe "DELETE /destroy" do
    it "Destroy Task" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      post login_path, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
      task = Task.create!(title: "testing", description: "hello testing", user_id: user.id)
      delete task_path(task)
      expect(response).to redirect_to(tasks_path)
    end

    it "Destroy Test" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      post login_path, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
      task = Task.create!(title: "testing", description: "hello testing", user_id: user.id)
      delete "/tasks/#{task.id}"
      expect(response).to redirect_to(tasks_path)
    end
  end

end