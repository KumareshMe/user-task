class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @tasks = @user.tasks
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "Your account info was successfully updated"
            redirect_to tasks_path
        else
            render 'edit'
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to User-Task #{@user.username}, you have signed up"
            redirect_to tasks_path
        else
            render 'new'
        end
    end

private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end