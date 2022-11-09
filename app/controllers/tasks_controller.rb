class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    flash[:notice] = "タスクが作成されました"
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    flash[:notice] = "タスクが編集されました"
    redirect_to tasks_path
  end

  private
    def task_params
      params.require(:task).permit(:title)
    end
end
