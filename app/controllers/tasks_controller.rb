class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def show
    end

    def index
      @tasks = Task.all
    end

    def new
     @task = Task.new
    end

    def create
      @task = Task.new(task_params)
      @task.user = User.first
      if @task.save
        flash[:notice] ="Task was created successfully."
        redirect_to @task
      else
        render 'new'
      end
    end

    def edit
    end

    def update
      if @task.update(task_params)
        flash[:notice] ="Task was updated successfully."
        redirect_to @task
      else
        render 'edit'
      end
    end
 
    def destroy
      
      @task.destroy
      redirect_to tasks_path
    end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
    params.require(:task).permit(:title, :description)
    end
end
